# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

### Tmux

```
pacman -S tmux
```

### Neovim

```
pacman -S nvim
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/Shiielty/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

## Configuration

### Tmux

Install tmux-plugin-manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Reset tmux or source the tmux

```
tmux source ~/.config/tmux/tmux.conf
```

Shortcut for install tmux plugin:

```
<prefix> + I
```

### Neovim

Make sure `.gitignore` & `.neoconf.json` file are copied to nvim config because `stow .` command are not copying those file.

Open neovim, it should automatically install the plugins with lazy.nvim

```
nvim
```

## Misc:

- Managing dotfiles with stow: https://www.youtube.com/watch?v=y6XCebnB9gs
- Tmux config: https://www.youtube.com/watch?v=DzNmUNvnB04
