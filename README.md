# Klrfl's Neovim Config

My personal Nvim config I built myself. It's a mix of my own code and YouTube tutorial code, specifically [typecraft](https://www.youtube.com/@typecraft_dev/playlists), [ThePrimeAgen](https://youtu.be/w7i4amO_zaE), and [devaslife](https://youtu.be/ajmK0ZNcM4Q). I use this config for my web dev needs.

## Overview

I use the following things in my config:

- lazy.nvim for package management
- Catppuccin Mocha for theme (as is the fact for my terminal, and dozens of other apps)
  - nvim-web-devicons (self explanatory)
  - colorful-menu.nvim for beautiful completion window
- a suite of toys from snacks.nvim. I now use it for my file picker, file tree, and even for opening lazygit within nvim. Really neat
- comment.nvim for quickly commenting a block of code using keybindings.
- conform for formatting code
- blink.cmp for completion
- csvview.nvim. Really handy for quickly looking at CSV files
- git stuff
  - git-conflict.nvim for resolving conflicts
  - gitsigns.nvim for git operations inside a buffer
- folke/zen-mode.nvim because I like centered buffers

## Dependecies/ things you have to install

- Nerd Fonts. I use [JetBrains Mono](https://www.nerdfonts.com/font-downloads) (not a requirement, but icons will not work if you don't have nerd fonts.)
- Git to clone this config
- GCC
- Node + NPM to install the LSPs
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- tree-sitter-cli for nvim-treesitter

last updated: Tue, 17 Feb 2026
