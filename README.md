# Nishant's Neovim Configuration

A modular Neovim configuration written in Lua.

## Features

- Telescope - fuzzy finder for files and live grep
- Harpoon - fast file navigation
- Treesitter - syntax highlighting and code parsing
- Rose Pine - color scheme with transparency support
- Fugitive - Git integration
- Undotree - visual undo history
- Rust tooling and keymaps

## Prerequisites

- Neovim 0.8+
- Git
- Node.js
- ripgrep
- fd

### Install dependencies

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install neovim git nodejs npm ripgrep fd-find

# macOS (Homebrew)
brew install neovim git node ripgrep fd

# Arch Linux
sudo pacman -S neovim git nodejs npm ripgrep fd
```

## Setup

1. Back up your existing config:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this repository:

```bash
git clone https://github.com/nishujangra/neovim-config.git ~/.config/nvim
cd ~/.config/nvim
```

3. Install Packer:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

4. Launch Neovim and install plugins:

```bash
nvim .
```

Inside Neovim, run `:PackerSync`, wait for the plugins to install, then restart.

## Structure

```
nvim/
├── init.lua                 # Entry point
├── lua/
│   └── nishujangra27/
│       ├── init.lua         # Config loader
│       ├── packer.lua       # Plugin definitions
│       ├── remap.lua        # Key mappings
│       └── set.lua          # Vim options
└── after/plugin/            # Plugin-specific config
    ├── colors.lua
    ├── fugitive.lua
    ├── harpoon.lua
    ├── telescope.lua
    ├── treesitter.lua
    └── undotree.lua
```

## Key Mappings

Leader key: `<Space>`

### Navigation

- `<leader>ff` - Find files (Telescope)
- `<C-g>` - Find git files
- `<leader>fs` - Live grep
- `<leader>back` - Open file explorer
- `<C-e>` - Toggle Harpoon menu
- `<C-h>`, `<C-t>`, `<C-n>`, `<C-s>` - Jump to Harpoon marks

### Git

- `<leader>gs` - Git status (Fugitive)

### Files

- `<leader>u` - Toggle Undotree
- `<leader>x` - Make file executable
- `<leader>s` - Search and replace current word

### Rust

- `<leader>rr` - Run
- `<leader>rd` - Debug
- `<leader>rh` - Hover actions
- `<leader>rc` - Code actions
- `<leader>rf` - Format
- `<leader>rt` - Run tests
- `<leader>rb` - Build

### Quality of life

- `J` - Join lines, keep cursor position
- `<C-d>` / `<C-u>` - Half page down/up, centered
- `n` / `N` - Search, centered
- `<leader>p` - Paste without yanking (visual mode)
- `<leader>d` - Delete without yanking
- `<C-c>` - Escape in insert mode

## Customization

### Color scheme

Uses Rose Pine with transparency. To change it, edit `lua/nishujangra27/packer.lua`, replace the colorscheme section, and run `:PackerSync`.

### Adding plugins

1. Add the plugin to `lua/nishujangra27/packer.lua`
2. Add its config in `after/plugin/`
3. Run `:PackerSync`

### Keymaps

Edit `lua/nishujangra27/remap.lua`.

## Troubleshooting

### Plugin installation

```bash
rm -rf ~/.local/share/nvim
nvim +PackerSync
```

### Performance

- Treesitter disables for files over 1MB
- Disable unused plugins if needed

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/name`
3. Commit your changes: `git commit -m 'Add feature'`
4. Push: `git push origin feature/name`
5. Open a pull request

## License

MIT - see [LICENSE](LICENSE).

## Acknowledgments

- [ThePrimeagen](https://github.com/ThePrimeagen) and [TJ DeVries](https://github.com/tjdevries) for inspiration
- The [Neovim](https://neovim.io/) team
- Plugin authors