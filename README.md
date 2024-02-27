<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

**Table of Contents** _generated with [DocToc](https://github.com/thlorenz/doctoc)_

- [My dotfiles](#my-dotfiles)
  - [Requirements](#requirements)
    - [Git](#git)
    - [Zsh](#zsh)
    - [Stow](#stow)
    - [Tmux](#tmux)
    - [Neovim](#neovim)
    - [Bash](#bash)
    - [Others](#others)
  - [Installation](#installation)
  - [Configuration](#configuration)
    - [Zsh](#zsh-1)
    - [Tmux](#tmux-1)
    - [Neovim](#neovim-1)
  - [Misc](#misc)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# My dotfiles

This directory contains the dotfiles for my system.

- OS: Arch Linux
- Shell: zsh
- DE: Hyprland
- Terminal: Kitty

## Requirements

Ensure you have the following installed on your system:

### Git

```bash
pacman -S git
```

### Zsh

```bash
# Install zsh
pacman -S zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install these 3 plugins
cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Stow

```bash
pacman -S stow
```

### Tmux

```bash
pacman -S tmux
```

### Neovim

```bash
pacman -S nvim
```

### Bash

```bash
# Install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
```

### Others

- eza
- zoxide
- ansible (optional)
- glow (optional)

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```bash
git clone git@github.com/Shiielty/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```bash
stow .
```

## Configuration

### Zsh

Make sure the path for oh-my-zsh and powerlevel10k are correct.

### Tmux

Install tmux-plugin-manager

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Reset tmux or source the tmux

```bash
tmux source ~/.config/tmux/tmux.conf
```

Shortcut for install tmux plugin:

```bash
<prefix> + I
```

### Neovim

Make sure `.gitignore` & `.neoconf.json` file are copied to nvim config because `stow .` command are not copying those file.

Open neovim, it should automatically install the plugins with lazy.nvim

```bash
nvim
```

## Misc

- [Managing dotfiles with stow](https://www.youtube.com/watch?v=y6XCebnB9gs)
- [Tmux config](https://www.youtube.com/watch?v=DzNmUNvnB04)
- [Hyprdots](https://github.com/prasanthrangan/hyprdots/)
