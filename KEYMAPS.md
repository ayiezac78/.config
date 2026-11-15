# Neovim Keymap Cheatsheet

> **Note:** `<leader>` is mapped to `Space`.

## Navigation & Scrolling

| Key | Mode | Action | 
| ----- | ----- | ----- | 
| `K` | Normal | Scroll half-page up and center cursor (`<C-u>zz`) | 
| `J` | Normal | Scroll half-page down and center cursor (`<C-d>zz`) | 
| `n` | Normal | Jump to next search match, centered & unfold (`nzzzv`) | 
| `N` | Normal | Jump to previous search match, centered & unfold (`Nzzzv`) | 

## Window & Split Management

| Key | Mode | Action | 
| ----- | ----- | ----- | 
| `<leader>v` | Normal | Create vertical split (`:vsplit`) | 
| `H` | Normal | Move focus to left split (`:wincmd h`) | 
| `L` | Normal | Move focus to right split (`:wincmd l`) | 
| `<leader>rr` | Normal | Rotate/swap split windows (`:wincmd r`) | 

## Fuzzy Finder (`telescope.nvim`)

*Extensions loaded: `fzf` (native C sorter), `ui-select` (dropdown menus), and `frecency`.*

| Key | Mode | Action |
| ----- | ----- | ----- |
| `<leader>sf` | Normal | Find files (`:Telescope find_files`) |
| `<leader>sr` | Normal | Find recent/frecent files in CWD (`:Telescope frecency`) |
| `<leader>sg` | Normal | Live grep across workspace (`:Telescope live_grep`) |
| `<leader>sb` | Normal | Search open buffers (`:Telescope buffers`) |
| `<leader>sd` | Normal | Search workspace diagnostics (`:Telescope diagnostics`) |
| `<leader>sh` | Normal | Search Neovim help tags (`:Telescope help_tags`) |
| `<leader>su` | Normal | View Git status files (`:Telescope git_status`) |
| `<leader>s.` | Normal | Resume previous Telescope picker (`:Telescope resume`) |

## File Explorer (`oil.nvim` & `oil-git-status.nvim`)

*Shows hidden files (`show_hidden = true`), watches for filesystem changes, displays Git status in the signcolumn (excluding ignored files), and disables all other default Oil keymaps (`use_default_keymaps = false`).*

| Key | Mode | Scope | Action | 
| ----- | ----- | ----- | ----- | 
| `<leader>e` | Normal | Global | Open Oil file explorer (`:Oil`) | 
| `<CR>` | Normal | `oil` buffer | Open selected file or directory (`actions.select`) | 

## Editing, Clipboard & Registers

| Key | Mode | Action | 
| ----- | ----- | ----- | 
| `U` | Normal | Redo (`<C-r>`) | 
| `<leader>p` | Normal | Paste without overwriting the unnamed register (`"_dP`) | 
| `<leader>y` | Normal, Visual | Yank selection/motion to system clipboard (`"+y`) | 
| `<leader>Y` | Normal | Yank entire line to system clipboard (`"+Y`) | 
| `<Esc>` | Normal | Clear search highlights & active multicursor namespaces | 

## Files, Buffers & Session

| Key | Mode | Action | 
| ----- | ----- | ----- | 
| `<leader>w` | Normal | Save current file (`:w`) | 
| `<leader>q` | Normal, Terminal | Quit current window/buffer (`:q`) | 
| `<C-c>` | Normal | Wipeout/close current buffer (`:bwipeout`) | 
| `<leader>re` | Normal | Restart Neovim (`:restart`) | 

## LSP & Code Actions (`nvim-lspconfig` & `tiny-code-action.nvim`)

*Enabled servers: `lua_ls`, `ts_ls`, `jsonls`, `yamlls`, `gopls`, `just` (with `SchemaStore.nvim`).*

| Key | Mode | Action | 
| ----- | ----- | ----- | 
| `<leader>gd` | Normal | Go to definition (`vim.lsp.buf.definition`) | 
| `<leader>gD` | Normal | Go to declaration (`vim.lsp.buf.declaration`) | 
| `<leader>gi` | Normal | Go to implementation (`vim.lsp.buf.implementation`) | 
| `<leader>gt` | Normal | Go to type definition (`vim.lsp.buf.type_definition`) | 
| `<leader>gr` | Normal | Find references (`vim.lsp.buf.references`) | 
| `<leader>h` | Normal | Hover documentation (`vim.lsp.buf.hover`) | 
| `<leader>rn` | Normal | Rename symbol (`vim.lsp.buf.rename`) | 
| `<leader>ca` | Normal, Visual | Open code actions picker (`tiny-code-action` via Telescope + Delta) | 

## Diagnostics & Project Tools

| Key | Mode | Action | 
| ----- | ----- | ----- | 
| `<leader>d` | Normal | Show diagnostic floating window (`<C-w>d`) | 
| `<leader>lv` | Normal | Run LÖVE2D project (`:!love .`) | 

## Git & Diff (`zdiff.nvim` & `gitsigns.nvim`)

*`gitsigns.nvim` is active with default sign column indicators (no custom keymaps bound).*

| Key | Mode | Scope | Action | 
| ----- | ----- | ----- | ----- | 
| `<leader>zd` | Normal | Global | Open Zdiff view (`:Zdiff`) | 
| `<CR>` | Normal | `zdiff` buffer | Open selected diff file (`:ZdiffOpen`) | 
| `<Tab>` | Normal | `zdiff` buffer | Toggle diff section/view (`:ZdiffToggle`) | 
| `m` | Normal | `zdiff` buffer | Toggle between uncommitted changes and `main` branch comparison | 
| `R` | Normal | `zdiff` buffer | Refresh Zdiff view (`:ZdiffRefresh`) | 
| `q` | Normal | `zdiff` buffer | Close Zdiff buffer (`:bdelete`) | 

## Autocompletion (`blink.cmp`)

*Applies in Insert and Command-line (`cmdline`) modes. Note: Completion menu does not auto-show in Insert mode (`auto_show = false`), while Ghost Text and Documentation popups are enabled.*

| Key | Mode | Action | Source | 
| ----- | ----- | ----- | ----- | 
| `<C-Space>` | Insert, Cmdline | Manually trigger completion menu (or toggle docs) | Custom | 
| `<Tab>` | Insert, Cmdline | Accept selected completion item (or fallback) | Custom | 
| `J` | Insert, Cmdline | Select next completion item (or fallback) | Custom | 
| `K` | Insert, Cmdline | Select previous completion item (or fallback) | Custom | 
| `<C-e>` | Insert, Cmdline | Hide completion menu | Default Preset | 
| `<C-y>` | Insert, Cmdline | Accept selected completion item | Default Preset | 
| `<Up>` / `<Down>` | Insert, Cmdline | Select previous / next item | Default Preset | 
| `<C-p>` / `<C-n>` | Insert, Cmdline | Select previous / next item | Default Preset | 
| `<C-b>` / `<C-f>` | Insert, Cmdline | Scroll documentation up / down | Default Preset | 
| `<C-k>` | Insert, Cmdline | Toggle signature help window | Default Preset | 
