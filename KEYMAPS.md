# Neovim Keymaps Cheatsheet

**Configuration:** NvChad 2.5\
**Leader key:** `Space`\
**File explorer:** NvimTree (right sidebar)

> Modes: `N` = Normal · `I` = Insert · `V` = Visual · `T` = Terminal ·
> `C` = Command · `X` = Visual/Select

**Accuracy note:** The mappings in sections 1--8 below are a baseline
based on standard NvChad 2.5 mappings, not a verified dump of every
mapping in your repository. Section 9 contains native Vim defaults.
Confirm mappings against your active configuration before relying on
them.

## 1. General

  Keymap         Mode   Description
  -------------- ------ ---------------------------
  `<Space>`      N      Leader key
  `<C-s>`        N      Save file
  `<C-c>`        N      Copy entire file
  `<Esc>`        N      Clear search highlights
  `<C-h>`        N      Move to left window
  `<C-j>`        N      Move to lower window
  `<C-k>`        N      Move to upper window
  `<C-l>`        N      Move to right window
  `<C-b>`        I      Move to beginning of line
  `<C-e>`        I      Move to end of line
  `<C-h>`        I      Move cursor left
  `<C-l>`        I      Move cursor right
  `<C-j>`        I      Move cursor down
  `<C-k>`        I      Move cursor up
  `<leader>n`    N      Toggle line numbers
  `<leader>rn`   N      Toggle relative numbers
  `<leader>fm`   N/X    Format file
  `<leader>ch`   N      Open NvChad cheatsheet

## 2. Buffer Management

  Keymap        Mode   Description
  ------------- ------ ----------------------
  `<leader>b`   N      Create new buffer
  `<Tab>`       N      Next buffer
  `<S-Tab>`     N      Previous buffer
  `<leader>x`   N      Close current buffer

## 3. File Explorer (NvimTree)

  Keymap        Mode   Description
  ------------- ------ -----------------
  `<C-n>`       N      Toggle NvimTree
  `<leader>e`   N      Focus NvimTree

## 4. Telescope

  -----------------------------------------------------------------------
  Keymap                  Mode                    Description
  ----------------------- ----------------------- -----------------------
  `<leader>ff`            N                       Find files

  `<leader>fa`            N                       Find all files,
                                                  including hidden and
                                                  ignored files

  `<leader>fw`            N                       Search text across
                                                  project

  `<leader>fb`            N                       Find open buffers

  `<leader>fh`            N                       Search help
                                                  documentation

  `<leader>fo`            N                       Find recently opened
                                                  files

  `<leader>fz`            N                       Search within current
                                                  buffer

  `<leader>ma`            N                       Find marks

  `<leader>cm`            N                       Browse Git commits

  `<leader>gt`            N                       Browse Git status

  `<leader>pt`            N                       Pick hidden terminal

  `<leader>th`            N                       Open NvChad theme
                                                  picker
  -----------------------------------------------------------------------

## 5. Terminal

  Keymap        Mode   Description
  ------------- ------ ----------------------------
  `<leader>h`   N      Open horizontal terminal
  `<leader>v`   N      Open vertical terminal
  `<A-v>`       N/T    Toggle vertical terminal
  `<A-h>`       N/T    Toggle horizontal terminal
  `<A-i>`       N/T    Toggle floating terminal
  `<C-x>`       T      Exit terminal mode

## 6. Comments

  Keymap        Mode   Description
  ------------- ------ -------------------------------
  `<leader>/`   N      Toggle current line comment
  `<leader>/`   V      Toggle selected lines comment

## 7. LSP and Diagnostics

  Keymap         Mode   Description
  -------------- ------ -----------------------------------
  `<leader>ds`   N      Send diagnostics to location list

Additional LSP mappings depend on the installed LSP configuration.

## 8. Which-Key

  Keymap         Mode   Description
  -------------- ------ ------------------------------
  `<leader>wK`   N      Show all available keymaps
  `<leader>wk`   N      Search for a specific keymap

## 9. Native Vim Essentials

  Keymap    Description
  --------- --------------------------------
  `i`       Enter insert mode
  `a`       Insert after cursor
  `o`       Open line below
  `O`       Open line above
  `v`       Enter visual mode
  `V`       Select entire line
  `yy`      Yank (copy) line
  `dd`      Delete line
  `p`       Paste after cursor
  `u`       Undo
  `<C-r>`   Redo
  `ciw`     Change inner word
  `diw`     Delete inner word
  `yiw`     Yank inner word
  `gg`      Go to first line
  `G`       Go to last line
  `0`       Go to beginning of line
  `$`       Go to end of line
  `w`       Move to next word
  `b`       Move to previous word
  `%`       Jump between matching brackets
  `*`       Search word under cursor
  `n`       Next search result
  `N`       Previous search result
  `za`      Toggle code fold
  `.`       Repeat last change

## Verify Your Active Keymaps

Inside Neovim, use:

``` vim
:map
```

This lists mappings. For more targeted inspection:

``` vim
:nmap
:imap
:vmap
:tmap
```

To inspect a specific mapping:

``` vim
:verbose nmap <leader>ff
```

The `:verbose` form can show where a mapping was last defined.

