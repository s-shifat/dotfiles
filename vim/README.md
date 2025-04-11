# .vimrc 

I wrote this rc file for the minimal features I want in vim.

## Setup
Simply copy everything from [`.vimrc`](./.vimrc) and paste it in `~/$HOME/.vimrc` file.

Some other quick ways:

### system independent
```bash
python3 -c "import urllib.request; urllib.request.urlretrieve('https://raw.githubusercontent.com/s-shifat/dotfiles/refs/heads/main/vim/.vimrc', '/home/$USER/.vimrc')"
```

### wget
```bash
wget -O ~/.vimrc https://raw.githubusercontent.com/s-shifat/dotfiles/refs/heads/main/vim/.vimrc
```

### curl
```bash
curl -o ~/.vimrc https://raw.githubusercontent.com/s-shifat/dotfiles/refs/heads/main/vim/.vimrc
```
