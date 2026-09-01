# Neovim Integration

This dotfiles repository installs a standalone Nix-managed Neovim configuration from:

```text
github:s-shifat/neovim
```

The Neovim configuration is maintained in its own repository and is consumed here as a pinned flake input.

This separation provides two independent stability boundaries:

```text
Neovim source repository
        │
        │ deliberate update
        ▼
dotfiles flake.lock
        │
        │ system rebuild
        ▼
installed production Neovim
```

Changes made in the Neovim repository do **not** automatically change the production editor installed by these dotfiles.

---

# Installed Commands

Home Manager installs two outputs from the Neovim flake:

```nix
home.packages = [
  inputs.neovim.packages.${system}.nvim
  inputs.neovim.packages.${system}.workflow-tools
];
```

This provides:

```text
nvim
nvim-next
nvim-exp
```

Their responsibilities are different.

## `nvim`

Production editor.

```text
nvim
→ immutable Nix-built configuration
→ revision pinned in this repository's flake.lock
```

Use this for normal work.

---

## `nvim-next`

Experimental editor.

```text
nvim-next
→ active Git experiment
→ live Lua configuration
→ isolated from production source
```

It uses the active experimental worktree created by `nvim-exp`.

---

## `nvim-exp`

Manages the experimental Git workflow.

Available commands:

```bash
nvim-exp setup
nvim-exp new <name>
nvim-exp status
nvim-exp discard
nvim-exp promote
```

---

# Stable Source vs Installed Stable

There are intentionally two different meanings of "stable."

## Source stable

The `main` branch of the standalone Neovim repository:

```text
~/projects/neovim
```

This contains the latest configuration that has successfully passed experimentation and been promoted.

## Installed stable

The revision pinned by this dotfiles repository:

```text
flake.lock
```

The two may temporarily differ.

For example:

```text
installed nvim
    commit A

Neovim main
    commit B

experiment/new-feature
    commit B + changes
```

This is expected.

Promoting an experiment updates the Neovim source repository.

Updating the dotfiles lock and rebuilding updates the production editor.

---

# Development Repository Setup

Stable `nvim` does not require a writable clone of the Neovim repository.

A local clone is required only for experimentation.

Run:

```bash
nvim-exp setup
```

If an appropriate local checkout already exists, it is adopted.

Otherwise the command asks for:

```text
Repository URL:
Clone location:
```

For example:

```text
Repository URL:
https://github.com/s-shifat/neovim.git
```

or:

```text
Repository URL:
git@github.com:s-shifat/neovim.git
```

Git determines whether HTTPS or SSH is used from the URL.

The default clone location is:

```text
~/projects/neovim
```

The corresponding experimental worktree defaults to:

```text
~/projects/neovim-next
```

The selected development repository is remembered in:

```text
~/.config/nvim-exp/repo-path
```

Check the current configuration with:

```bash
nvim-exp status
```

---

# Typical Workflow: Simple Lua Change

A simple change modifies editor behavior without changing the Nix dependency graph.

Examples:

* keybindings
* editor options
* autocommands
* plugin configuration
* Telescope settings
* statusline settings
* colors or UI behavior
* LSP behavior when no new executable is required

These changes require **no Nix rebuild while experimenting**.

## Example: Experiment with keybindings

Create an experiment:

```bash
nvim-exp new keybindings
```

This creates:

```text
~/projects/neovim
  branch: main

~/projects/neovim-next
  branch: experiment/keybindings
```

Open the experimental editor:

```bash
nvim-next
```

Edit the corresponding Lua file under:

```text
~/projects/neovim-next/config/
```

For example:

```text
~/projects/neovim-next/config/lua/user/core/keymaps.lua
```

The development loop is:

```text
edit Lua
   ↓
restart nvim-next
   ↓
test
   ↓
edit again
```

No:

```bash
nix build
```

and no:

```bash
nixos-rebuild
```

are required for normal Lua iteration.

Production:

```bash
nvim
```

remains unchanged during the entire experiment.

---

# Keeping an Experiment

When the change is satisfactory:

```bash
cd ~/projects/neovim-next

git status
git diff
```

Commit the change:

```bash
git add config/
git commit -m "feat(keymaps): add navigation bindings"
```

Leave the experimental worktree:

```bash
cd ~
```

Promote:

```bash
nvim-exp promote
```

Promotion:

```text
checks clean experiment
        ↓
builds candidate #nvim
        ↓
fast-forwards experiment into main
        ↓
removes experimental worktree
        ↓
deletes experiment branch
```

The Neovim source repository is now updated.

The globally installed production `nvim` is still unchanged.

Push the Neovim repository:

```bash
cd ~/projects/neovim

git push origin main
```

Then deploy it through these dotfiles as described below.

---

# Rejecting an Experiment

If the experiment is unsuccessful:

```bash
cd ~

nvim-exp discard
```

The command asks for confirmation before removing:

```text
~/projects/neovim-next
```

and its:

```text
experiment/<name>
```

branch.

Production `nvim` and Neovim `main` remain unchanged.

---

# Dependency-Changing Experiments

Some changes modify the Nix dependency graph rather than only Lua.

Examples include:

* adding or removing a Neovim plugin
* adding a Treesitter parser
* adding an LSP executable
* adding a formatter
* adding a linter
* changing Neovim itself
* changing another external executable used by Neovim

These are different from Lua-only changes.

## Experimental workflow

Create an experiment normally:

```bash
nvim-exp new new-plugin
```

Modify the required Nix definitions inside:

```text
~/projects/neovim-next/
```

Then launch:

```bash
nvim-next
```

`nvim-next` runs the experimental environment through the experiment's Nix flake.

If its dependency graph changed, Nix may need to evaluate, download, or build the new environment.

Conceptually:

```text
change Nix dependency
        ↓
launch nvim-next
        ↓
Nix prepares changed environment
        ↓
dependency becomes available
        ↓
continue Lua iteration normally
```

Once that dependency has been prepared, changing only Lua does not require rebuilding it repeatedly.

## Important distinction

An experimental dependency change does **not** require rebuilding the whole NixOS system.

This:

```bash
nvim-next
```

uses the experiment's own Nix development environment.

A NixOS/Home Manager rebuild is needed only when the accepted change is later deployed to production through this dotfiles repository.

---

# Example: Add a Plugin

The intended future workflow is:

```bash
nvim-exp new add-plugin
```

Modify the plugin dependency declaration in:

```text
~/projects/neovim-next/nix/
```

and configure the plugin under:

```text
~/projects/neovim-next/config/
```

Then:

```bash
nvim-next
```

The first launch after changing the Nix dependency may build or download additional dependencies.

Subsequent Lua changes can be tested simply by restarting:

```bash
nvim-next
```

When satisfied:

```bash
cd ~/projects/neovim-next

git add .
git commit -m "feat(editor): add plugin"
```

Then:

```bash
cd ~
nvim-exp promote
```

Push the Neovim source:

```bash
cd ~/projects/neovim
git push origin main
```

Finally deploy the new stable revision through the dotfiles.

---

# Deploying a Promoted Neovim Revision

After an experiment has been promoted and pushed, the Neovim repository may be newer than the production version pinned here.

From the dotfiles repository:

```bash
cd ~/dotfiles
```

Update only the Neovim input:

```bash
nix flake update neovim
```

Do not normally use a full:

```bash
nix flake update
```

when the intention is only to deploy a new Neovim revision.

Inspect the lock-file change:

```bash
git diff -- flake.lock
```

The important change should be:

```text
neovim
old revision → new revision
```

The Neovim flake maintains its own dependency pinning, so related nested Neovim inputs may also change when appropriate.

---

# Safe Production Deployment

Before switching to the new configuration, evaluate it:

```bash
nix eval \
  .#nixosConfigurations.<hostname>.config.system.build.toplevel.drvPath
```

Then build without activating:

```bash
sudo nixos-rebuild build --flake .#<hostname>
```

If the build succeeds:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

Now:

```bash
nvim
```

uses the newly pinned Neovim revision.

This is the production transition:

```text
experiment
    ↓
nvim-exp promote
    ↓
Neovim main
    ↓
git push
    ↓
nix flake update neovim
    ↓
nixos-rebuild build
    ↓
nixos-rebuild switch
    ↓
production nvim
```

---

# Simple Change vs Dependency Change

## Simple Lua change

Example:

```text
new keybinding
```

Experimental cycle:

```bash
nvim-exp new keybinding
nvim-next
```

Edit Lua.

Restart:

```bash
nvim-next
```

No rebuild is required during experimentation.

After promotion, production deployment still requires:

```text
update dotfiles Neovim pin
+
NixOS/Home Manager rebuild
```

because production `nvim` is immutable.

---

## Dependency-changing change

Example:

```text
new plugin or language server
```

Experimental cycle:

```bash
nvim-exp new new-plugin
```

Modify both Nix dependencies and Lua configuration.

Launch:

```bash
nvim-next
```

Nix prepares the changed experimental dependency environment.

After that, Lua iteration remains fast.

After promotion, production deployment again requires:

```text
update dotfiles Neovim pin
+
NixOS/Home Manager rebuild
```

---

# Why Even Lua Changes Need a Production Rebuild

Lua is live only in:

```text
nvim-next
```

Production:

```text
nvim
```

contains an immutable copy of the configuration in the Nix store.

Therefore:

```text
experimental Lua edit
→ no rebuild

promoted production Lua edit
→ update flake pin
→ rebuild/switch
```

This is intentional.

It prevents an accidental edit in a working directory from silently changing the production editor.

---

# Checking Current State

From anywhere:

```bash
nvim-exp status
```

Example:

```text
Development source
  repo:       /home/user/projects/neovim
  state:      ready
  remote:     git@github.com:user/neovim.git
  branch:     main
  commit:     abc1234
  working:    clean

Experiment
  active:     none
  worktree:   /home/user/projects/neovim-next
```

When an experiment exists:

```text
Experiment
  worktree:   /home/user/projects/neovim-next
  branch:     experiment/keybindings
  commit:     def5678
  working:    modified
```

---

# Edge Cases

## `nvim-exp` says the development repository is not initialized

Run:

```bash
nvim-exp setup
```

The stable editor is unaffected and remains usable:

```bash
nvim
```

---

## The repository was cloned somewhere else

Run:

```bash
nvim-exp setup
```

and select the existing clone location.

The selected path is stored in:

```text
~/.config/nvim-exp/repo-path
```

Alternatively, temporarily override it:

```bash
NVIM_STABLE_REPO=/path/to/neovim \
nvim-exp status
```

---

## The saved repository path no longer exists

Run:

```bash
nvim-exp setup
```

and provide the new location.

If necessary, remove the saved path manually:

```bash
rm ~/.config/nvim-exp/repo-path
```

Then run:

```bash
nvim-exp setup
```

again.

---

## `nvim-next` says there is no active experiment

Create one:

```bash
nvim-exp new feature-name
```

Then:

```bash
nvim-next
```

`nvim-next` intentionally does not create experiments by itself.

---

## `nvim-exp new` says an experiment already exists

Inspect it:

```bash
nvim-exp status
```

There is intentionally only one active experimental worktree by default.

Either finish and promote it:

```bash
nvim-exp promote
```

or discard it:

```bash
nvim-exp discard
```

before beginning another experiment.

---

## Stable source has uncommitted changes

`nvim-exp new` and `nvim-exp promote` may refuse to continue if the stable repository is dirty.

Inspect:

```bash
cd ~/projects/neovim

git status
git diff
```

Commit or intentionally discard those changes before continuing.

This prevents an experiment from being created from an ambiguous source state.

---

## Experiment has uncommitted changes during promotion

Promotion requires a clean committed experiment.

Inspect:

```bash
cd ~/projects/neovim-next

git status
git diff
```

Then commit:

```bash
git add .
git commit -m "feat: describe change"
```

Leave the worktree:

```bash
cd ~
```

and retry:

```bash
nvim-exp promote
```

---

## Shell is currently inside the experimental worktree

`discard` or `promote` may refuse to remove a worktree while the current shell is inside it.

Leave it first:

```bash
cd ~
```

Then retry:

```bash
nvim-exp discard
```

or:

```bash
nvim-exp promote
```

---

## Stable `main` advanced after the experiment was created

Promotion intentionally refuses to silently merge diverged histories.

Inside the experiment:

```bash
cd ~/projects/neovim-next

git rebase main
```

Resolve any conflicts if required.

Retest:

```bash
nvim-next
```

Then:

```bash
cd ~
nvim-exp promote
```

---

## Promotion succeeded but `nvim` still behaves like the old version

This is expected.

`nvim-exp promote` updates:

```text
Neovim main
```

not:

```text
dotfiles flake.lock
```

Check the source repository:

```bash
cd ~/projects/neovim

git log --oneline -3
```

Push it:

```bash
git push origin main
```

Then update the dotfiles pin:

```bash
cd ~/dotfiles

nix flake update neovim
```

Build and switch.

Only then will production:

```bash
nvim
```

use the promoted revision.

---

## Neovim source was pushed but the dotfiles still use an older revision

Inspect:

```bash
git diff -- flake.lock
```

or update:

```bash
nix flake update neovim
```

The dotfiles lock file deliberately controls when production advances.

---

## `nixos-rebuild build` fails after a Neovim update

Do not switch.

The currently running system and current production Neovim remain unchanged.

Fix or roll back the Neovim revision before trying again.

One option is to restore the previous lock file:

```bash
git restore flake.lock
```

Then evaluate/build again.

---

## A new Neovim revision is bad after switching

NixOS generations provide system-level rollback.

The Git history and previous `flake.lock` revision also provide source-level rollback.

Do not rewrite the Neovim repository history merely to recover production.

Prefer normal Git/Nix rollback mechanisms.

---

# Global Commands vs Repository Commands

Once these dotfiles have been deployed, use the globally installed commands:

```bash
nvim
nvim-next
nvim-exp
```

There is normally no need to invoke:

```text
~/projects/neovim/result/bin/...
```

Those local build outputs are useful only while developing the Neovim framework itself.

The global commands are the intended normal interface.

---

# Typical Daily Workflow

Normal editing:

```bash
nvim
```

Start an experiment:

```bash
nvim-exp new feature-name
```

Test it:

```bash
nvim-next
```

Check state:

```bash
nvim-exp status
```

Reject:

```bash
cd ~
nvim-exp discard
```

or keep:

```bash
cd ~/projects/neovim-next

git add .
git commit -m "feat: implement feature"

cd ~

nvim-exp promote
```

Push:

```bash
cd ~/projects/neovim

git push origin main
```

Deploy later when desired:

```bash
cd ~/dotfiles

nix flake update neovim

sudo nixos-rebuild build --flake .#<hostname>
sudo nixos-rebuild switch --flake .#<hostname>
```

---

# Mental Model

The most important model is:

```text
                 LIVE EXPERIMENT
                 nvim-next
                     │
                     ▼
             experiment/<feature>
                     │
             nvim-exp promote
                     ▼
               Neovim main
               source stable
                     │
                  git push
                     ▼
                Git remote
                     │
          nix flake update neovim
                     ▼
            dotfiles flake.lock
            deployed stable pin
                     │
             nixos-rebuild switch
                     ▼
               production nvim
```

At every boundary, advancing to the next level is deliberate.

That is the core reliability model of this Neovim setup.

