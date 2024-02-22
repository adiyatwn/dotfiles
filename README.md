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

## Misc:

- More on managing dotfiles with stow: https://www.youtube.com/watch?v=y6XCebnB9gs
