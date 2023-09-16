# SOLARVIM 

SolarVim (svim) is a neovim layer that replaces the default nvim config. This adds more features then what neovim has out of the box. This is just my config and not meant to be a distrobution. There might be plugins that do not work. If you have any issues, you can submit an issue and if I have time, I can look into it.

Solarvim was originally made using the "nvim-basic-ide" by LunarVim but the colorscheme was changed and a couple plugins added (That's where the name SolarVim came from, because I'm unoriginal). I wanted to change from null-ls after the repo was archived but realized I didn't understand how anything worked enough to do it so I rebuilt SolarVim with kickstart. Since then, in a matter of a couple days I have transformed it into what it is now.

## Install Instructions

### Remove or rename ~/.local/share/nvim/
- rm -rf ~/.local/share/nvim/
- mv ~/.local/share/nvim/ ~/.local/share/nvim.bak

### Remove or rename ~/.config/nvim/
- rm -rf ~/.config/nvim/
- vm ~/.config/nvim/ ~/.config/nvim.bak

### Clone Repository
- git clone git@github.com:NotNoss/SolarVim.git ~/.config/nvim/

### Run nvim
- nvim

## Uninstall SolarVim
Uninstalling SolarVim will return you to the default neovim configuration.

### Remove SolarVim Configuration
- rm -rf ~/.config/nvim/

### Remove SolarVim Plugins
- rm -rf ~/.local/share/nvim/

### Run NeoVim
- nvim

### TODO
- DAPInstall.nvim
- formatter
- linter
- nvim-ufo
- vim-illuminate
- neotest
- TreeSJ
- Add a Winbar
- Clean plugin init
