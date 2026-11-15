# Neovim Keymap & Plugin Cheatsheet

A modular, high-performance Neovim setup built around native `vim.pack.add`, system-installed binaries, and conflict-free keybindings.

---

## 1. General Editing & Line Movement

| Keymap | Mode | Action | Notes |
| :--- | :--- | :--- | :--- |
| `<A-j>` / `<A-Down>` | Normal | Move current line down | Auto-indents (`==`) |
| `<A-k>` / `<A-Up>` | Normal | Move current line up | Auto-indents (`==`) |
| `<A-j>` / `<A-Down>` | Visual | Move selected block down | Preserves selection & auto-indents (`gv=gv`) |
| `<A-k>` / `<A-Up>` | Visual | Move selected block up | Preserves selection & auto-indents (`gv=gv`) |

---

## 2. File Navigation (`oil.nvim` & `telescope.nvim`)

### Oil File Explorer
| Keymap | Mode | Action | Notes |
| :--- | :--- | :--- | :--- |
| `<leader>e` | Normal | Open Oil in current window | Replaces netrw |
| `<leader>ee` | Normal | Toggle Oil floating window | Runs `:Oil --float` / `toggle_float()` |
| `-` | Normal (Oil) | Navigate to parent directory | Built-in Oil mapping |
| `<CR>` | Normal (Oil) | Open file or directory | Built-in Oil mapping |

### Telescope Fuzzy Finder
| Keymap | Mode | Action |
| :--- | :--- | :--- |
| `<leader>sf` | Normal | Find files |
| `<leader>sg` | Normal | Live grep across workspace |
| `<leader>sb` | Normal | Search open buffers |
| `<leader>sh` | Normal | Search help tags |
| `<leader>sd` | Normal | Search workspace diagnostics |

---

## 3. Terminal Emulator (`toggleterm.nvim`)

| Keymap | Mode | Action | Notes |
| :--- | :--- | :--- | :--- |
| `<C-\>` | Normal / Terminal | Toggle default floating terminal | Keeps background shell alive |
| `<leader>ft` | Normal | Toggle floating terminal | Rounded border |
| `<leader>fh` | Normal | Toggle horizontal split terminal | Height: 15 lines |
| `<leader>fv` | Normal | Toggle vertical split terminal | Width: 40% of columns |
| `<leader>gg` | Normal | Toggle floating Lazygit | Dedicated git UI session |
| `<Esc><Esc>` | Terminal | Exit terminal insert mode | Enters Normal mode (`<C-\><C-n>`) |
| `<C-h/j/k/l>` | Terminal | Navigate between split windows | Seamless window switching |

---

## 4. Testing (`neotest`)

Configured with adapters for **Vitest**, **Playwright**, **Go (`neotest-golang`)**, and **Pytest (`neotest-python`)**.

| Keymap | Mode | Action |
| :--- | :--- | :--- |
| `<leader>tr` | Normal | Run nearest test under cursor |
| `<leader>tf` | Normal | Run all tests in current file |
| `<leader>ts` | Normal | Toggle test summary tree |
| `<leader>to` | Normal | Open floating test output window |
| `<leader>tO` | Normal | Toggle persistent test output panel |
| `<leader>tS` | Normal | Stop currently running test |

---

## 5. LSP, Linting & Formatting (`conform.nvim`)

### Enabled Native Language Servers (`vim.lsp.enable`)
* **Web / JS / TS:** `vtsls` (or `ts_ls`), `biome`, `vue_ls` (Volar), `astro`, `jsonls`
* **Python:** `ruff` (linting & quick-fixes), `ty` (or `pyright` for static type checking)
* **Systems & Config:** `lua_ls`, `gopls`, `yamlls`, `just`

### Formatting Strategy (`conform.nvim`)
Formatting runs automatically on save (`format_on_save`) with dynamic root detection (`vim.fs.root`) for Biome projects:

| Filetype(s) | Primary Formatter / Linter | Fallback (if no `biome.json`) |
| :--- | :--- | :--- |
| `javascript`, `typescript`, `jsx`, `tsx`, `vue` | `biome-check` | `eslint_d` $\rightarrow$ `prettierd` |
| `json`, `jsonc`, `graphql`, `css` | `biome-check` | `prettierd` |
| `astro`, `html`, `markdown`, `yaml` | `prettierd` | — *(requires `prettier-plugin-astro` for `.astro`)* |
| `python` | `ruff_organize_imports`, `ruff_format` | — |
| `lua` | `stylua` | — |
| `go` | `goimports`, `gofumpt` | — |
| `sh` | `shfmt` | — |
| `sql` | `sql_formatter` (`--language postgresql`) | — |

| Keymap | Mode | Action |
| :--- | :--- | :--- |
| `<leader>mp` | Normal / Visual | Manually format current buffer or visual selection |

---

## 6. System Binary Checklist

Ensure the following CLI tools and language servers are installed on your system `PATH`:
* **Formatters & Linters:** `biome`, `stylua`, `prettierd`, `eslint_d`, `ruff`, `goimports`, `gofumpt`, `shfmt`, `sql-formatter`
* **Language Servers:** `@vtsls/language-server` (or `typescript-language-server`), `@biomejs/biome`, `@vue/language-server`, `@astrojs/language-server`, `ty` (or `pyright`), `lua-language-server`, `gopls`, `yaml-language-server`, `vscode-langservers-extracted`
