# dotfiles

## Install
Macos
```
sh -c "$(curl -fsSL https://lucas.tools/install)"
```

Linux
```
sh -c "$(wget -O - https://lucas.tools/install)"
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
    - vim-test
    - vim-copilot
  - vimrc

To add vim plugins, use git submodules.
Ex: `git submodule add https://github.com/vim-test/vim-test vim/pack/plugins/start/vim-test` 

### Fonts
- [Hack](https://sourcefoundry.org/hack/)


## Mac Only install
- Applications
  - Dozer
  - Github Desktop
  - iTerm2
  - Spotify
  - 1Password
- Preferences
  - Lots of system preferences changes, commented in [`osx/preferences.sh`](osx/preferences.sh)
  - TouchID enabled for sudo commands
  - Change background
  - This is all reversible! Just run `osx-backup.sh` to restore your original preferences
