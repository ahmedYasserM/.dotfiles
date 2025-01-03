require "nvchad.options"

-- add yours here!

local o = vim.o
o.clipboard = "unnamedplus"
-- o.cursorlineopt = 'both' -- to enable cursorline!

vim.o.relativenumber = false

-- Enable inlay hints
vim.lsp.inlay_hint.enable(true)

vim.o.foldmethod = "indent"
vim.o.foldlevel = 99


-- Hide neovim statusline
vim.cmd([[
set laststatus=0
hi! link StatusLine Normal
hi! link StatusLineNC Normal
set statusline=%{repeat('─',winwidth('.'))}
"colorscheme tokyonight-night
]])

-- vim.cmd([[
-- autocmd BufEnter,BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window -t " . $TMUX_PANE . " '" . expand("%") . "'")
-- " Restore automatic renaming of the tmux window when vim exits
-- if exists('$TMUX')
--     " Rename only the current Tmux pane's window
--     autocmd BufEnter * call system("tmux rename-window -t " . $TMUX_PANE . " '" . expand("%:t") . "'")
--     autocmd VimLeave * call system("tmux setw -t " . $TMUX_PANE . " automatic-rename")
-- endif
-- ]])


-- Disable Diagnostic Virtual Text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})
