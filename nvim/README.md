## Steps

Resources:

  * [awesome-neovim](https://github.com/rockerBOO/awesome-neovim)


Steps:
1. Install neovim using the package manager
2. Create ~/.config/nvim/init.lua and ~/.config/nvim/lua
3. For copy-paste support: sudo pacman -S xsel
4. For python support: pip install pynvim
5. Install javascript components:
    * sudo pacman -S nodejs
    * sudo pacman -S npm
    * sudo pacman -S yarn
6. For lsp:
    * pip install pyright
    * npm i -g pyright

7. For Telescope:
    * sudo pacman -S ripgrep
    * sudo pacman -S chafa [Telescope media_file_extension]
    * sudo pacman -S imagemagick [Telescope media_file_extension]
    * sudo pacman -S ffmpegthumbnailer [Telescope media_file_extension]
    * yay -S poppler [Telescope media_file_extension]
    * sudo pacman -S fontpreview [Telescope media_file_extension]

8. For Null-ls:
    * npm i -g @johnnymorganz/stylua-bin
    * pip install black
    * npm i -g prettier
    * Run :checkhealth to see whether there is more to add


### TODO

* add in plugin-config-files where needed:
  
```
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

```
