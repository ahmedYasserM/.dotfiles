require "nvchad.mappings"

-------------------------------------------------------------------------------- Global Keymaps Start ----------------------------------------------------------------

local map = vim.keymap.set

map("n", "L", "g_")
map("n", "H", "_")
map("n", "<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>")
map("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

vim.cmd "let g:tmux_navigator_no_mappings = 1"
vim.cmd "nnoremap <silent> <M-h> :<C-U>TmuxNavigateLeft<cr>"
vim.cmd "nnoremap <silent> <M-j> :<C-U>TmuxNavigateDown<cr>"
vim.cmd "nnoremap <silent> <M-k> :<C-U>TmuxNavigateUp<cr>"
vim.cmd "nnoremap <silent> <M-l> :<C-U>TmuxNavigateRight<cr>"

-- Clear Highlights
map("n", "<Esc>", ":nohl<CR>")

--- Toggle inlay hints
local function toggle_inlay_hint()
  local is_enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not is_enabled)
end
map("n", "<A-.>", function()
  toggle_inlay_hint()
end)

-------------------------------------------------------------------------------- Global Keymaps End ------------------------------------------------------------------

-------------------------------------------------------------------------------- CMP Keymaps Start -------------------------------------------------------------------

local cmp = require "cmp"
local luasnip = require "luasnip"

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  completion = { completeopt = "select" },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<M-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<M-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
  window = {
    completion = cmp.config.window.bordered {
      border = "rounded",
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
    },
  },
}

-------------------------------------------------------------------------------- CMP Keymaps End ---------------------------------------------------------------------

-------------------------------------------------------------------------------- Telescope Configs Start -------------------------------------------------------------

local telescope = require "telescope"
local builtin = require "telescope.builtin"
local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"
require("telescope").load_extension "projects"

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "obj",
      "bin",
    },
  },
}

local buffer_searcher
buffer_searcher = function()
  builtin.buffers {
    sort_mru = true,
    show_all_buffers = false,
    attach_mappings = function(prompt_bufnr, map)
      local refresh_buffer_searcher = function()
        actions.close(prompt_bufnr)
        vim.schedule(buffer_searcher)
      end
      local delete_buf = function()
        local selection = action_state.get_selected_entry()
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
        refresh_buffer_searcher()
      end
      local delete_multiple_buf = function()
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selection = picker:get_multi_selection()
        for _, entry in ipairs(selection) do
          vim.api.nvim_buf_delete(entry.bufnr, { force = true })
        end
        refresh_buffer_searcher()
      end
      map("n", "dd", delete_buf)
      map("n", "<C-k>", delete_multiple_buf)
      map("i", "<C-k>", delete_multiple_buf)
      return true
    end,
  }
end

map("n", "<M-i>", builtin.find_files, {})
map("n", "<Tab>", builtin.find_files, {})
map("n", "<M-o>", buffer_searcher, {})
map("n", "<M-u>", builtin.live_grep, {})
map("n", "<M-p>", require("telescope").extensions.projects.projects, {})

-------------------------------------------------------------------------------- Telescope Configs End ---------------------------------------------------------------

-------------------------------------------------------------------------------- Copilot Configs Start ---------------------------------------------------------------

map("i", "<A-;>", 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })

-------------------------------------------------------------------------------- Copilot Configs End -----------------------------------------------------------------

-------------------------------------------------------------------------------- NvimTree Configs Start --------------------------------------------------------------

map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
-- map("n", "<leader>e", ":lua MiniFiles.open()<CR>", { silent = true })

-------------------------------------------------------------------------------- NvimTree Configs End ----------------------------------------------------------------

-------------------------------------------------------------------------------- Go Configs Start --------------------------------------------------------------------

-- Define a variable to keep track of the current state
local is_tag_add = true

-- Function to toggle between GoTagAdd and GoTagRm
local function toggle_go_tag()
  if is_tag_add then
    vim.cmd('GoTagAdd')
  else
    vim.cmd('GoTagRm')
  end
  -- Toggle the state
  is_tag_add = not is_tag_add
end

-- Map a key to the toggle function (e.g., <leader>gt)
vim.keymap.set('n', '<leader>gt', toggle_go_tag, { noremap = true, silent = true, desc = "Toggle GoTagAdd/GoTagRm" })
map("n", "<leader>st", ":GoTestAdd<CR>", { silent = true })
map("n", "<leader>l", ":GoIfErr<CR>", { silent = true })


map("n", "K", "<cmd>lua require(\"pretty_hover\").hover()<CR>", { silent = true })

-------------------------------------------------------------------------------- Go Configs End -------------------------------------------------------------------



-------------------------------------------------------------------------------- Rust Configs Start ------------------------------------------------------------------

local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

return M

-------------------------------------------------------------------------------- Rust Configs End --------------------------------------------------------------------
