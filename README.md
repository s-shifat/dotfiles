# My Arch Machine Configuration
I use Arch btw

# What I'm Using

- OS: Arch Linux
- WM: Hyprland
- Terminal: Kitty
- Shell: fish
- Text/Code Editor: Neovim (Lunarvim)
- ColorScheme: Catpuccin (Mostly)

# Dotfiles Management
I decided to use gnu stow.
Basic Steps:

## Creating backup of an existing config (Say: lvim)

1. Create the pacakge directory (lvim) inside dotfiles repo.:
     ```bash
    mkdir lvim
    ```
2. Move everything from device config folder to dotfiles repo following this structure:
     ```bash
    mv ~/.config/lvim ~/dotfiles/lvim/.config/
    ```
    So, the package directory is like you're in the home directory `~/`. And then you add the necessary directories from your home directory to reach to the configuration files of that package.
    In this case:<br> `~/.config/lvim` is pointing to `~/dotfiles/lvim/.config/lvim`

Now the backing up is done. You can commit the changes to origin.

## Restoring/Installing a config (Say: lvim)

1. Clone repo to home directory and navigate inside it:
     ```bash
    git clone git@github.com:s-shifat/dotfiles.git && cd dotfiles
    ```
2. Now just stow whichever pacakages you need:
     ```bash
    stow lvim
    ```
    It will create a symlink follwing the path inside package dir from home directory. In this case `~/.config/lvim`

**NOTE:** There might be some instances when a config already exists. In that case, stow will through up a warning,
and won't do anything. There are many solutions to this, however the most straight forward and non-efficient way is to simply delete or move the
existing config to another place. And then try to do `stow lvim`. I may make a script later to automate this, so, for now let's keep this manual process.

