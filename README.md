<div align="center">

# Dotfiles

Your go-to configuration for the best developer experience.

</div>

---

## :rocket: Quick Install

**MacOS**:
```bash
sh -c "$(curl -fsSL https://lucas.tools/install)"
```

**Linux**:
```bash
sh -c "$(wget -O - https://lucas.tools/install)"
```

## :wrench: Features

### :computer: CLI Tools

* 🐚 [ZSH](https://www.zsh.org): The Z shell.
  - 🌟 [Oh-My-Zsh](https://ohmyz.sh): A delightful community-driven framework for managing Zsh configuration.
    - 🔎 [zsh-z](https://github.com/agkozak/zsh-z): Jump quickly to directories.
    - 🧶 [yarn-autocomplete](https://github.com/buonomo/yarn-completion): Autocomplete for yarn.

* 🛠 **General Utilities**:
  - 🦇 [bat](https://github.com/sharkdp/bat): A better `cat` with syntax highlighting.
  - 📑 [ctags](https://ctags.io): Source code indexing.
  - 🐙 [git](https://git-scm.com): Distributed version control system with:
    - [gitconfig](https://git-scm.com/docs/git-config)
    - [gitignore](https://git-scm.com/docs/gitignore)
    - Custom templates: Victory sounds on every commit 🎵
  - ✨ [prettier](https://prettier.io): Opinionated code formatter.
  - 🔍 [ripgrep](https://github.com/BurntSushi/ripgrep): A line-oriented search tool.
  - 🔒 [1password-cli](https://support.1password.com/command-line/): Command-line tool for 1Password.

### :memo: Editor - Vim

* **Plugins**:
  - ❌ [ale](https://github.com/dense-analysis/ale): Asynchronous linting/fixing.
  - 🔄 [surround](https://github.com/tpope/vim-surround): Parentheses, brackets, quotes, XML tags, and more.
  - 🏷 [tagbar](https://github.com/preservim/tagbar): Display tags in a window.
  - ✈️ [vim-airline](https://github.com/vim-airline/vim-airline): Lean & mean status/tabline.
  - 🕵️ [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper.
  - 📈 [vim-gitgutter](https://github.com/airblade/vim-gitgutter): Show a git diff in the sign column.
  - 💅 [vim-prettier](https://github.com/prettier/vim-prettier): Prettier integration for Vim.
  - 📜 [vim-solidity](https://github.com/TovarishFin/vim-solidity): Solidity syntax files for Vim.
  - 🧪 [vim-test](https://github.com/vim-test/vim-test): A Vim wrapper for running tests.
  - 🚀 [vim-copilot](https://github.com/github/copilot.vim): GitHub Copilot for Vim.

* 📖 vimrc: My Vim configuration file.

<details>
<summary><strong>Adding Vim Plugins</strong></summary>

To add vim plugins, use git submodules.

Example:
```bash
git submodule add https://github.com/vim-test/vim-test vim/pack/plugins/start/vim-test
```

</details>

### :art: Aesthetics

* 🖋 [Hack](https://sourcefoundry.org/hack/): A typeface for source code.

## :apple: MacOS Exclusives

* **Applications**:
  - 👓 [Dozer](https://github.com/Mortennn/Dozer): Hide menu bar items.
  - 🖥 [Github Desktop](https://desktop.github.com): A fast and friendly Git GUI.
  - 🖥 [iTerm2](https://iterm2.com): macOS terminal replacement.
  - 🎵 [Spotify](https://www.spotify.com): Music streaming service.
  - 🔒 [1Password](https://1password.com): Password manager.

* **Preferences**:
  - Dive into abundant system preferences changes in [`osx/preferences.sh`](osx/preferences.sh).
  - 🖐 Use `TouchID` for sudo commands.
  - 🌄 Non distracting gray background
  - ⚠️ **Everything's reversible!** Run `osx-backup.sh` to restore your original settings.

---

<div align="center">
  <sub>Brought to you by [Lucas.Tools](https://lucas.tools).</sub>
</div>

---
