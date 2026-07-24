# Nishant's Neovim Configuration

A modular, IDE-grade Neovim configuration written in Lua. Managed with
[lazy.nvim](https://github.com/folke/lazy.nvim), with full LSP, completion,
formatting, and AI (Claude Code + Codex) integration — tuned for Rust, Go, and C.

## Features

- **lazy.nvim** — modern plugin manager, lazy-loads by default, lockfile-pinned
- **LSP** (mason + nvim-lspconfig) — go-to-definition, hover, rename, diagnostics
  for Rust, Go, C/C++, Lua, Python, TypeScript
- **blink.cmp** — fast completion menu with LSP + snippet + path sources
- **conform.nvim** — format-on-save (rustfmt, gofmt/goimports, clang-format, …)
- **AI tooling** — Claude Code and Codex CLIs in floating terminals
- **Language tooling** — rustaceanvim + crates.nvim (Rust), go.nvim (Go),
  clangd tuning (C/C++)
- **Telescope** — fuzzy finder for files and live grep
- **Harpoon** — fast file navigation
- **Treesitter** — syntax highlighting and parsing
- **Rose Pine (moon)** — dark color scheme with transparency
- **Fugitive** + **gitsigns** — Git integration
- **Undotree** — visual undo history
- **which-key**, **lualine**, **trouble**, **autopairs** — quality of life

## Prerequisites

- Neovim **0.11+**
- Git, Node.js + npm, ripgrep, fd
- A [Nerd Font](https://www.nerdfonts.com/) (for lualine/devicons)

### Install core dependencies

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install neovim git nodejs npm ripgrep fd-find clangd clang-format bear

# macOS (Homebrew)
brew install neovim git node ripgrep fd llvm bear

# Arch Linux
sudo pacman -S neovim git nodejs npm ripgrep fd clang bear
```

### Language toolchains (as needed)

```bash
# Rust
rustup component add rust-analyzer clippy rustfmt

# Go
go install golang.org/x/tools/gopls@latest   # or let :Mason install it
```

> Most language servers (gopls, lua-ls, pyright, ts_ls) are installed
> automatically by `mason` on first launch. clangd/clang-format come from your
> system package manager (above).

### AI CLIs (optional but recommended)

```bash
npm install -g @anthropic-ai/claude-code
npm install -g @openai/codex
```

Then authenticate once by running `claude` and `codex` in a terminal. These use
your **subscription login** — no API keys required.

## Setup

1. Back up any existing config:

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Clone this repository:

   ```bash
   git clone https://github.com/nishujangra/nvim-config.git ~/.config/nvim
   ```

3. Launch Neovim:

   ```bash
   nvim
   ```

   lazy.nvim **bootstraps itself** and installs all plugins on first launch.
   Wait for it to finish, then restart Neovim. That's it — no manual plugin
   manager install, no sync command.

4. (Optional) Verify everything is healthy:

   ```
   :Lazy          " plugin status
   :Mason         " language server status
   :checkhealth   " overall diagnostics
   ```

## Structure

```
nvim/
├── init.lua                    # Entry point (loads options, remaps, lazy)
├── lua/
│   ├── config/
│   │   └── lazy.lua            # lazy.nvim bootstrap + setup
│   ├── nishujangra/
│   │   ├── init.lua            # Config loader
│   │   ├── remap.lua           # Key mappings
│   │   └── set.lua             # Vim options
│   └── plugins/                # One file per concern (lazy specs)
│       ├── editor.lua          # colorscheme, undotree, fugitive, harpoon
│       ├── telescope.lua
│       ├── treesitter.lua
│       ├── lsp.lua             # mason + lspconfig + on-attach keymaps
│       ├── completion.lua      # blink.cmp
│       ├── format.lua          # conform.nvim (format on save)
│       ├── ai.lua              # Claude Code + Codex
│       ├── rust.lua            # rustaceanvim + crates.nvim
│       ├── go.lua              # go.nvim
│       └── ui.lua              # which-key, gitsigns, lualine, trouble, …
└── after/plugin/               # Keymaps for core plugins
    ├── fugitive.lua
    ├── harpoon.lua
    ├── telescope.lua
    └── undotree.lua
```

## Key Mappings

Leader key: `<Space>`

### Navigation & files

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (Telescope) |
| `<C-g>` | Find git files |
| `<leader>fs` | Live grep (prompts for string) |
| `<leader>back` | Open netrw file explorer |
| `<leader>a` | Add current file to Harpoon |
| `<C-e>` | Toggle Harpoon menu |
| `<C-h>` / `<C-t>` / `<C-n>` / `<C-s>` | Jump to Harpoon file 1 / 2 / 3 / 4 |
| `<leader>u` | Toggle Undotree |

### LSP (active in any code buffer)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>e` | Show diagnostic float |
| `<leader>zig` | Restart LSP |

### AI

| Key | Action |
|-----|--------|
| `<leader>cc` | Toggle Claude Code (floating) |
| `<leader>co` | Toggle Codex CLI (floating) |
| `<leader>ct` | Toggle raw Claude CLI (floating) |

### Rust (rustaceanvim)

| Key | Action |
|-----|--------|
| `<leader>rr` | Runnables |
| `<leader>rd` | Debuggables |
| `<leader>rh` | Hover actions |
| `<leader>rc` | Code action |
| `<leader>rf` | Format |
| `<leader>rt` | Testables |
| `<leader>rC` | Open Cargo.toml |
| `<leader>rD` | Open docs |
| `<leader>re` | Explain error |
| `<leader>rp` | Parent module |

> Tip: run `:RustLsp <Tab>` in a Rust file to see all available actions.

### Git

| Key | Action |
|-----|--------|
| `<leader>gs` | Git status (Fugitive) |

### Editing / quality of life

| Key | Action |
|-----|--------|
| `J` (visual) / `K` (visual) | Move selected lines down / up |
| `J` (normal) | Join lines, keep cursor position |
| `<C-d>` / `<C-u>` | Half page down / up, centered |
| `n` / `N` | Next / prev search, centered |
| `<leader>p` (visual) | Paste without clobbering register |
| `<leader>y` / `<leader>Y` | Yank to system clipboard |
| `<leader>d` | Delete without yanking |
| `<C-c>` | Escape (insert mode) |
| `<leader>s` | Search & replace word under cursor |
| `<leader>x` | Make current file executable |
| `<leader>ee` / `<leader>ef` / `<leader>el` | Insert Go `if err != nil` snippets |
| `<leader><leader>` | Source current file |

> With **which-key** installed, press `<leader>` and pause to see a live popup
> of every binding — you never need to memorize this table.

## Customization

### Color scheme

Uses **Rose Pine (moon)** with transparency. To change the variant, edit the
`vim.cmd.colorscheme(...)` line in [`lua/plugins/editor.lua`](lua/plugins/editor.lua):
`rose-pine-main` (default dark), `rose-pine-moon` (deeper dark), or
`rose-pine-dawn` (light). Preview live with `:colorscheme rose-pine-dawn`.

### Adding plugins

1. Create or edit a file in `lua/plugins/` returning a lazy spec table.
2. Restart Neovim (or run `:Lazy sync`).

### Language servers

Add a server name to `ensure_installed` in
[`lua/plugins/lsp.lua`](lua/plugins/lsp.lua) and configure it in the `servers`
table. Run `:Mason` to manage server binaries interactively.

### Keymaps

Global maps live in [`lua/nishujangra/remap.lua`](lua/nishujangra/remap.lua);
LSP maps are in the `LspAttach` block of `lua/plugins/lsp.lua`; per-plugin maps
are under `after/plugin/`.

## Troubleshooting

### Reinstall all plugins

```bash
rm -rf ~/.local/share/nvim ~/.local/state/nvim
nvim   # lazy re-bootstraps and reinstalls
```

### LSP not attaching

- `:LspInfo` — is a client attached to the buffer?
- `:Mason` — is the server installed? (clangd needs a system install)
- For C/C++, generate `compile_commands.json` (`bear -- make`, or CMake with
  `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON`) for accurate clangd results.

### Performance

- Treesitter highlighting auto-disables for files over 1 MB.
- `:Lazy profile` — inspect plugin load times.

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/name`
3. Commit your changes
4. Push and open a pull request

## License

MIT — see [LICENSE](LICENSE).

## Acknowledgments

- [ThePrimeagen](https://github.com/ThePrimeagen) and
  [TJ DeVries](https://github.com/tjdevries) for inspiration
- The [Neovim](https://neovim.io/) team and all plugin authors
