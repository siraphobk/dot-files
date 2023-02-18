# dot-files

<!-- vim-markdown-toc GFM -->

- [Recommended programs to install before beginning the setup](#recommended-programs-to-install-before-beginning-the-setup)
- [Tmux](#tmux)
- [Neovim](#neovim)
  - [Pre-requisites](#pre-requisites)
  - [Configuration files](#configuration-files)
- [(Kitty Terminal)[https://github.com/kovidgoyal/kitty]](#kitty-terminalhttpsgithubcomkovidgoyalkitty)
- [Nerd Fonts](#nerd-fonts)

<!-- vim-markdown-toc -->

## Recommended programs to install before beginning the setup

- [Homebrew](https://brew.sh/)
- [Nodejs](https://nodejs.org/en/)
- [Yarn](https://yarnpkg.com/)
- [Rust](https://www.rust-lang.org/tools/install)

## Tmux

To install Tmux, please run the following command.

```bash
sudo apt install tmux
```

## Neovim

### Pre-requisites

- Neovim (v0.7.0+) <https://github.com/neovim/neovim/wiki/Installing-Neovim>

### Configuration files

Configuration files are inside `nvim` directory. To quickly create symlinks for
config files, please run the following command.

```bash
make stow-nvim-scripts
```

## (Kitty Terminal)[https://github.com/kovidgoyal/kitty]

For installation, please navigate to <https://sw.kovidgoyal.net/kitty/binary/#binary-install>.

Setting Kitty as the default terminal in Ubuntu

```bash
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator <PATH TO KITTY BIN> 50

# ref: https://github.com/kovidgoyal/kitty/issues/1101#issuecomment-483072764
```

## [Nerd Fonts](https://www.nerdfonts.com/)

Useful for displaying icons and glyphs.
