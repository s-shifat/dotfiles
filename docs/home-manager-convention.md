# Home Manager module convention

Home Manager modules for user space packages live in `system/modules/home/`.
Each package has its own directory with this structure:

```text
system/modules/home/kitty/
├── default.nix
├── package.nix
├── config.nix
└── theme.conf       # Native configuration files, when applicable
```

- `default.nix` only imports `package.nix` and `config.nix`.
- `package.nix` contains installation and activation logic, such as `home.packages`, `programs.<name>.enable`, or a package wrapper.
- `config.nix` contains settings and wires in any native configuration files.
- Other files in the directory are the package's native configuration files, when needed.

Use `config.nix` consistently; do not use `settings.nix` for this role. Use the singular `package.nix`, not `packages.nix`. Keep `config.nix` in the structure even when a package currently has no configuration.

For a single package, its `default.nix` looks like this:

```nix
{ ... }:

{
  imports = [
    ./package.nix
    ./config.nix
  ];
}
```

## Package groups

Related packages can live under a group directory. Each package inside the group follows the same structure, and the group's `default.nix` imports only its package directories:

```text
system/modules/home/utils/
├── default.nix
├── bat/
│   ├── default.nix
│   ├── package.nix
│   └── config.nix
├── lazygit/
│   ├── default.nix
│   ├── package.nix
│   └── config.nix
└── ripgrep/
    ├── default.nix
    ├── package.nix
    └── config.nix
```

For example, `utils/default.nix` imports `./bat`, `./lazygit`, and `./ripgrep`. The top-level `system/modules/home/default.nix` then imports only `./utils` for that group. Direct package modules are likewise imported by directory name, such as `./kitty`.
