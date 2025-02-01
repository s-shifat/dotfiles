# LunarVim

# Installation: 
Follw the instructions from [here](https://www.lunarvim.org/docs/installation)

# Plugin Highlights

## Jupynium
I use [ `Jupynium` ](https://github.com/kiyoon/jupynium.nvim) for my typical python-datascience workflow, as it requires
interactive coding. Right now I like jupyter notebooks. But the LSP and other
IDE functionalites doesn't really work well. That's where Jupynium comes in. I can edit everything
directly from lvim and it syncs with jupyter notebook via browser automation.

### Setup
#### Firefox Setup
1. Open firefox and go to `about:profiles`
2. Create a profile named `jupynium`
3. Launch this profile and install [ `vimium` ](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/) plugin.
4. Make sure it is not set as default browser profile so that your existing profile goes away.

#### Virtual environment setup
1. Activate the virtual environment. If using `poetry` do:
    ```fish
    eval (poetry env activate)
    ```
2. Install the project dependencies if not already installed
3. Install `ipykernel`:
    ```fish
    pip install ipykernel
    # or
    poetry add ipykernel
    ```
5. Now add the current virtual environment to kernel list by doing:
    ```fish

    python -m ipykernel install --user --name your_kernel_name --display-name "Your Kernel Name"
    ```
6. Now launch lvim and open that *.ju.py file and `<leader>ini` and sync with the `.ipynb` file

### DataScience and Neovim Setups And Limitations
https://vi.stackexchange.com/questions/45059/interactive-python-script-development
