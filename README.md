# 🚀 Nishant's Neovim Configuration

A modern, modular Neovim configuration optimized for productivity and development efficiency. Built with Lua and designed for maintainability.

## ✨ Features

- **🔍 Telescope** - Fuzzy finder for files, live grep, and more
- **🎯 Harpoon** - Lightning-fast file navigation and project management
- **🌳 Treesitter** - Advanced syntax highlighting and code parsing
- **🎨 Rose Pine** - Beautiful, modern color scheme with transparency support
- **📝 Fugitive** - Git integration and workflow
- **⏪ Undotree** - Visual undo history management
- **⌨️ Smart Keybindings** - Intuitive mappings for enhanced productivity
- **🦀 Rust Development** - Comprehensive Rust tooling and keymaps

## 🛠️ Prerequisites

- **Neovim 0.8+** (recommended: latest stable)
- **Git** for plugin management
- **Node.js** (for Treesitter and LSP)
- **ripgrep** (for Telescope live grep)
- **fd** (for better file finding)

### Installation Commands

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install neovim git nodejs npm ripgrep fd-find

# macOS (with Homebrew)
brew install neovim git node ripgrep fd

# Arch Linux
sudo pacman -S neovim git nodejs npm ripgrep fd
```

## 🚀 Quick Start

### 1. Backup Your Existing Config

```bash
# Backup current config (if exists)
mv ~/.config/nvim ~/.config/nvim.backup
```

### 2. Clone This Repository

```bash
git clone https://github.com/nishujangra/neovim-config.git ~/.config/nvim
cd ~/.config/nvim
```

### 3. Install Dependencies

```bash
# Install Packer (plugin manager)
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 4. Launch Neovim and Install Plugins

```bash
nvim .
```

Once inside Neovim, run:
```
:PackerSync
```

Wait for all plugins to install, then restart Neovim.

## 📁 Configuration Structure

```
nvim/
├── init.lua                 # Entry point
├── lua/
│   └── nishujangra27/
│       ├── init.lua        # Main configuration loader
│       ├── packer.lua      # Plugin definitions
│       ├── remap.lua       # Key mappings
│       └── set.lua         # Vim options
└── after/plugin/           # Plugin-specific configurations
    ├── colors.lua
    ├── fugitive.lua
    ├── harpoon.lua
    ├── telescope.lua
    ├── treesitter.lua
    └── undotree.lua
```

## ⌨️ Key Mappings

### Leader Key
- **Leader**: `<Space>` (modern standard)

### Navigation
- `<leader>ff` - Find files with Telescope
- `<C-g>` - Find git files
- `<leader>fs` - Live grep
- `<leader>back` - Open file explorer
- `<C-e>` - Toggle Harpoon menu
- `<C-h>`, `<C-t>`, `<C-n>`, `<C-s>` - Navigate to Harpoon marks

### Git Integration
- `<leader>gs` - Open Git status (Fugitive)

### File Management
- `<leader>u` - Toggle Undotree
- `<leader>x` - Make file executable
- `<leader>s` - Search and replace current word

### Rust Development
- `<leader>rr` - Run Rust code
- `<leader>rd` - Debug Rust code
- `<leader>rh` - Hover actions
- `<leader>rc` - Code actions
- `<leader>rf` - Format code
- `<leader>rt` - Run tests
- `<leader>rb` - Build project

### Quality of Life
- `J` - Join lines with cursor positioning
- `<C-d>/<C-u>` - Half page down/up with center
- `n/N` - Search with center positioning
- `<leader>p` - Paste without yanking (visual mode)
- `<leader>d` - Delete without yanking
- `<C-c>` - Escape in insert mode

## 🎨 Customization

### Color Scheme
The configuration uses Rose Pine with transparency. To change:

1. Edit `lua/nishujangra27/packer.lua`
2. Replace the colorscheme section
3. Run `:PackerSync`

### Adding Plugins
1. Add to `lua/nishujangra27/packer.lua`
2. Create configuration in `after/plugin/`
3. Run `:PackerSync`

### Modifying Keymaps
Edit `lua/nishujangra27/remap.lua` to customize keybindings.

## 🔧 Troubleshooting

### Plugin Installation Issues
```bash
# Clean and reinstall
rm -rf ~/.local/share/nvim
nvim +PackerSync
```

### Performance Issues
- Check for large files (Treesitter disables for files > 1MB)
- Ensure you have sufficient RAM
- Consider disabling unused plugins

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [ThePrimeagen](https://github.com/ThePrimeagen) & [TJ DeVries](https://github.com/tjdevries) for inspiration and best practices
- [Neovim](https://neovim.io/) team for the amazing editor
- Plugin authors for their excellent work

## 📞 Support

If you encounter any issues:

1. Check the [Issues](https://github.com/nishujangra/nvim-config/issues) page
2. Create a new issue with detailed information
3. Include your Neovim version and OS details