# Neovim Keybinding Cheatsheet

Leader key: `<Space>` (normal and visual mode). Key names are case-sensitive: `<leader>h` and `<leader>H` are different.

This lists the explicit mappings found in this configuration. Plugin defaults and mappings supplied dynamically by other plugins may not be listed.

## General editing and navigation

| Key | Mode | Action |
|---|---|---|
| `<A-j>` / `<A-Down>` | Normal | Move current line down |
| `<A-k>` / `<A-Up>` | Normal | Move current line up |
| `<A-j>` / `<A-Down>` | Visual | Move selection down |
| `<A-k>` / `<A-Up>` | Visual | Move selection up |
| `U` | Normal | Redo |
| `H` / `L` | Normal | Move to left / right split |
| `<leader>rr` | Normal | Rotate split windows (global mapping; Rust buffers use this chord for Rust runnables instead) |
| `<leader>re` | Normal | Restart Neovim |
| `<Esc>` | Normal | Clear search highlights and configured multicursors |
| `<leader>d` | Normal | Show diagnostic float |
| `<leader>w` | Normal | Save current file |
| `<leader>q` | Normal / Terminal | Quit current buffer |
| `<C-c>` | Normal | Wipe out current buffer |
| `J` / `K` | Normal | Scroll down / up and center the cursor (Rust buffers use `K` for Rust hover actions instead) |
| `n` / `N` | Normal | Next / previous search result, centered |
| `<leader>p` | Normal | Paste without replacing the unnamed register |
| `<leader>y` | Normal / Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `<leader>v` | Normal | Open a vertical split |
| `<leader>lv` | Normal | Run `love .` (Love2D) |

## File navigation and search

### Oil

| Key | Mode / context | Action |
|---|---|---|
| `<leader>e` | Normal | Open Oil file explorer |
| `<CR>` | Oil buffer | Open selected file or directory |

Oil is configured with its default keymaps disabled, so only the explicitly configured `<CR>` action is guaranteed here.

### Telescope

| Key | Mode | Action |
|---|---|---|
| `<leader>sf` | Normal | Find files |
| `<leader>sr` | Normal | Search recently/frequently opened files (frecency) |
| `<leader>sg` | Normal | Live grep in workspace |
| `<leader>sb` | Normal | Search open buffers |
| `<leader>sd` | Normal | Search diagnostics |
| `<leader>sh` | Normal | Search help tags |
| `<leader>su` | Normal | Telescope Git status |
| `<leader>s.` | Normal | Resume last Telescope picker |
| `<leader>lg` | Normal | Open Lazygit |

## LSP and code actions

| Key | Mode | Action |
|---|---|---|
| `<leader>ca` | Normal / Visual | Code action (Rust buffers use rustaceanvim's grouped code action) |
| `<leader>gd` | Normal | Go to definition |
| `<leader>gD` | Normal | Go to declaration |
| `<leader>gi` | Normal | Go to implementation |
| `<leader>gt` | Normal | Go to type definition |
| `<leader>gr` | Normal | Find references |
| `<leader>h` | Normal | Show LSP hover documentation |
| `<leader>rn` | Normal | Rename symbol |

## Completion (Blink)

| Key | Mode / context | Action |
|---|---|---|
| `<Tab>` | Insert, completion menu | Accept selected completion; otherwise fall back to normal Tab behavior |
| `<C-Space>` | Insert | Show completion menu |
| `J` / `K` | Insert, completion menu | Select next / previous completion item |

The completion menu is configured not to open automatically while typing. Documentation popups and signature help are enabled.

## Testing (Neotest)

| Key | Mode | Action |
|---|---|---|
| `<leader>tr` | Normal | Run nearest test |
| `<leader>tf` | Normal | Run tests in current file |
| `<leader>ts` | Normal | Toggle test summary |
| `<leader>to` | Normal | Open test output |
| `<leader>tO` | Normal | Toggle persistent test output panel |
| `<leader>tS` | Normal | Stop running test |

Configured adapters: Vitest, Playwright, Go, and Pytest.

## Terminal

The default ToggleTerm opens as a vertical split on the right. Use `<C-h>` from the terminal to return to the editor and `<C-l>` from the editor to focus the terminal; focusing a terminal window resumes terminal input.

| Key | Mode | Action |
|---|---|---|
| `<C-\\>` | Normal / Terminal | Toggle default right-side terminal |
| `<C-h>` | Normal / Terminal | Focus left window (terminal-to-editor when terminal is on the right) |
| `<C-l>` | Normal / Terminal | Focus right window (editor-to-terminal when terminal is on the right) |
| `<leader>ft` | Normal | Toggle floating terminal |
| `<leader>fh` | Normal | Toggle horizontal terminal |
| `<leader>fv` | Normal | Toggle right-side vertical terminal |
| `<Esc><Esc>` | Terminal | Leave terminal input mode |

## Formatting and editing helpers

| Key | Mode | Action |
|---|---|---|
| `<leader>m` | Normal | Toggle bracket/line split-join (`mini.splitjoin`) |

Formatting runs automatically on save through Conform. No explicit manual-format keymap is currently defined in the Lua configuration.

## Debugging (DAP)

| Key | Mode | Action |
|---|---|---|
| `<leader>db` | Normal | Toggle breakpoint |
| `<leader>dc` | Normal | Continue / start debugging |
| `<leader>do` | Normal | Step over |
| `<leader>di` | Normal | Step into |
| `<leader>dt` | Normal | Debug nearest Go test |

## Git diff view

| Key | Mode / context | Action |
|---|---|---|
| `<leader>zd` | Normal | Open Zdiff |
| `<CR>` | Zdiff buffer | Open diff item |
| `<Tab>` | Zdiff buffer | Toggle diff view |
| `R` | Zdiff buffer | Refresh diff |
| `m` | Zdiff buffer | Toggle comparison against `main` / working changes |
| `q` | Zdiff buffer | Close diff buffer |

## Rust (Rust buffers only)

| Key | Mode | Action |
|---|---|---|
| `<leader>rr` | Normal | Open Rust runnables |
| `<leader>rt` | Normal | Open Rust testables |
| `<leader>ca` | Normal | Rust grouped code actions |
| `K` | Normal | Rust hover actions |

These are buffer-local mappings, so they override the global `<leader>rr`, `<leader>ca`, and `K` mappings only in Rust buffers.

## Harpoon (after adding the suggested Harpoon config)

| Key | Mode | Action |
|---|---|---|
| `<leader>ha` | Normal | Add current file to Harpoon list |
| `<leader>hh` | Normal | Open Harpoon quick menu |
| `<leader>1`–`<leader>4` | Normal | Jump to Harpoon item 1–4 |
| `<leader>hp` | Normal | Go to previous Harpoon item |
| `<leader>hn` | Normal | Go to next Harpoon item |

These are the mappings from the suggested Harpoon setup; Harpoon itself is not yet configured in the repository, so these shortcuts will work only after you add that plugin configuration and load it from `lua/plugins/init.lua`.
