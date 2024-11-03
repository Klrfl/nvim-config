# Klrfl's Neovim Config

My personal Nvim config I built myself. It's a mix of my own code and YouTube tutorial code, specifically [typecraft](https://www.youtube.com/@typecraft_dev/playlists), [ThePrimeAgen](https://youtu.be/w7i4amO_zaE), and [devaslife](https://youtu.be/ajmK0ZNcM4Q). I use this config for my web dev needs.

After using my config for a while, I decided to change my plugin manager from Packer to Lazy.nvim. All the plugins are now in `lua/plugins`.

## Dependecies/ things you have to install

- Nerd Fonts. I use [JetBrains Mono](https://www.nerdfonts.com/font-downloads) (not a requirement, but icons will not work if you don't have nerd fonts.)
- Git to clone this config
- GCC
- Node + NPM to install the LSPs
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## Special note: Vue LS

When upgrading my LS for Vue to 2.0.7 I found myself scouring over github for solutions.
I followed these threads:

- [vuejs/language-tools/issues/3925](https://github.com/vuejs/language-tools/issues/3925)
- [vuejs/language-tools/issues/4106](https://github.com/vuejs/language-tools/issues/4106)
- [neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vue-support](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vue-support)

This took me a week to resolve so it better be worth it.
