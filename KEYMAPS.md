# Neovim Keybinding Cheatsheet

Leader key: `<Space>` (normal and visual mode). Key names are case-sensitive: `<leader>h` and `<leader>H` are different.

This documents configured mappings and relevant plugin-local mappings. See [Potential overlaps](#potential-overlaps) for mappings that share a prefix or override a built-in key.

## General editing and navigation

| Key | Mode | Action |
|---|---|---|
| `<A-j>` / `<A-Down>` | Normal | Move current line down |
| `<A-k>` / `<A-Up>` | Normal | Move current line up |
| `<A-j>` / `<A-Down>` | Visual | Move selection down |
| `<A-k>` / `<A-Up>` | Visual | Move selection up |
| `U` | Normal | Redo |
| `H` / `L` | Normal | Move to left / right split (MiniFiles uses these locally for navigation instead) |
| `<leader>rr` | Normal | Rotate split windows (Rust buffers use this for Rust runnables instead) |
| `<leader>re` | Normal | Restart Neovim |
| `<Esc>` | Normal | Clear search highlights and configured multicursors |
| `<leader>d` | Normal | Show diagnostic float |
| `<leader>w` | Normal | Save current file |
| `<leader>q` | Normal / Terminal | Quit current buffer |
| `<C-c>` | Normal | Wipe out current buffer |
| `J` / `K` | Normal | Scroll down / up and center (Rust buffers use `K` for Rust hover actions) |
| `n` / `N` | Normal | Next / previous search result, centered |
| `<leader>p` | Normal | Paste without replacing the unnamed register |
| `<leader>y` | Normal / Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `<leader>v` | Normal | Open a vertical split |
| `<leader>lv` | Normal | Run `love .` (Love2D) |

## File navigation and search

### mini.files

| Key | Mode / context | Action |
|---|---|---|
| `-` | Normal | Open MiniFiles explorer |
| `<leader>-` | Normal | Open MiniFiles and reveal the current working directory/current file context |
| `<leader>e` | Normal | Toggle MiniFiles explorer |
| `<CR>` | MiniFiles | Enter selected directory or open selected file |
| `L` | MiniFiles | Enter/open with the alternate go-in action |
| `_` | MiniFiles | Go to parent directory |
| `H` | MiniFiles | Parent directory alternate go-out action |
| `q` | MiniFiles | Close explorer (MiniFiles default) |
| `g?` | MiniFiles | Show MiniFiles help (MiniFiles default) |
| `=` | MiniFiles | Synchronize filesystem changes (MiniFiles default) |

MiniFiles uses a column view; `j` / `k` move through entries. The configured `H` / `L` actions are buffer-local and take precedence over the global split-navigation mappings while inside MiniFiles.

### MiniPick / MiniExtra

| Key | Mode | Action |
|---|---|---|
| `<leader>pf` | Normal | MiniPick file picker |
| `<leader>ps` | Normal | Grep for the word under the cursor |
| `<leader>vh` | Normal | MiniPick help picker |
| `<leader>xx` | Normal | MiniExtra diagnostics picker |
| `<leader>pk` | Normal | Search keymaps |

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
| `<leader>ca` | Normal / Visual | Code action (Rust buffers use rustaceanvim grouped code action) |
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

The default terminal is configured as a vertical split. `<C-h>` and `<C-l>` navigate to left and right windows in both Normal and Terminal modes; `<C-j>` and `<C-k>` navigate down/up while in Terminal mode.

| Key | Mode | Action |
|---|---|---|
| `<C-\\>` | Normal / Terminal | Toggle default right-side terminal |
| `<C-h>` / `<C-l>` | Normal / Terminal | Focus left / right window |
| `<C-j>` / `<C-k>` | Terminal | Focus lower / upper window |
| `<leader>ft` | Normal | Toggle floating terminal (if configured) |
| `<leader>fh` | Normal | Toggle horizontal terminal (if configured) |
| `<leader>fv` | Normal | Toggle right-side vertical terminal |
| `<Esc><Esc>` | Terminal | Leave terminal input mode |

## Formatting and editing helpers

| Key | Mode | Action |
|---|---|---|
| `<leader>m` | Normal | Toggle bracket/line split-join (`mini.splitjoin`) |

Formatting runs automatically on save through Conform. No explicit manual-format keymap is currently defined.

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

These buffer-local mappings override global mappings only in Rust buffers.

## Harpoon

| Key | Mode | Action |
|---|---|---|
| `<leader>ha` | Normal | Add current file to Harpoon list |
| `<leader>hh` | Normal | Open Harpoon quick menu |
| `<leader>1`–`<leader>4` | Normal | Jump to Harpoon item 1–4 |
| `<leader>hp` | Normal | Go to previous Harpoon item |
| `<leader>hn` | Normal | Go to next Harpoon item |

## Potential overlaps

- `<leader>p` is a complete paste mapping and also the prefix for `<leader>pf`, `<leader>ps`, and `<leader>pk`. These sequences are distinct mappings, but Neovim may wait briefly after `<leader>p` to determine whether another key follows. If that feels inconvenient, move the picker shortcuts to another prefix.
- `<leader>v` opens a vertical split and is the prefix of `<leader>vh` (MiniPick help). Neovim waits for the next key or timeout after `<leader>v`; consider moving the help picker mapping if this is awkward.
- `-` is remapped globally in Normal mode to open MiniFiles, replacing the built-in backward-line motion. Inside MiniFiles, `_` is the configured parent-directory key; `H` is its alternate parent-navigation mapping.
- `H` / `L` behave as global split-navigation keys but are overridden by MiniFiles buffer-local navigation mappings while the explorer is active. This context-specific override is expected.
- `<C-h>` / `<C-l>` are configured for both Normal and Terminal modes by ToggleTerm. The mode distinction avoids a same-mode mapping collision with terminal-only `<C-j>` / `<C-k>` mappings, but those keys all control window focus when active in their respective modes.
