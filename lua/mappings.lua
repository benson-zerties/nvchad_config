require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map <leader>bd to close the current filebuffer while keeping the editor window open
vim.keymap.set('n', '<leader>bd', function ()
    vim.cmd('bprevious')
    vim.cmd('bdelete #')
  end,
  { noremap = true, silent = true }
)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- NvChad terminal module configures an empty "" filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "",
  callback = function(args)
    vim.keymap.set('n', 'gf', function()
      local f = vim.fn.findfile(vim.fn.expand('<cfile>'))
      print(f)
      if (f ~= '') then
        local all_wins = vim.api.nvim_list_wins()
        local last_win_idx = vim.fn.winnr('#')
        local last_win_id = all_wins[last_win_idx]
        vim.api.nvim_set_current_win(last_win_id)
        vim.cmd.edit(f)
      end
    end)
  end
})
