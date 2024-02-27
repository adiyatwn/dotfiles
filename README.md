# My dotfiles

**Table of Content**
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Misc](#misc)

---

**My System:**

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

### Bash (if you want)

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

```bash
# Install tmux-plugin-manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Reset tmux or source the tmux
tmux source ~/.config/tmux/tmux.conf
```

Install tmux plugin with `<prefix> + I` command on tmux.

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
