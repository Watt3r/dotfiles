# dotfiles

## Install
```
git clone --recurse-submodules git@github.com:Watt3r/dotfiles.git
cd dotfiles
./install
```


## What will be downloaded
### CLI Tools
- zsh
  - zsh
  - oh-my-zsh
    - zsh-z
    - yarn-autocomplete
- general tools
  - bat
  - ctags
  - git
    - gitconfig
    - gitignore
    - git-templates
      - victory sounds on every commit
  - prettier
  - ripgrep

### Editor
- Vim
  - plugins
    - ale
    - surround
    - tagbar
    - vim-airline
    - vim-fugitive
    - vim-gitgutter
    - vim-prettier
    - vim-solidity
  - vimrc


### Fonts
- Source Code Pro for Powerline

## Mac Only install
- Applications
  - Dozer
  - Github Desktop
  - Google Chrome
  - iTerm2
  - Spotify
- Preferences
  - Lots of system preferences changes, commented in [`osx-preferences.sh`](osx-preferences.sh)
  - Change background
### ⚠ Not automated
Tell iTerm2 to use the config file in the root of this repo
```
General -> Preferences -> Load preferences from a custom foler or URL
```
