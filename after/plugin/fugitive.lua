vim.keymap.set('n', '<leader>hc', '<cmd>Git commit<Enter>')

function pushToUpstream()
  local current_branch = vim.fn.systemlist("git branch --show-current")[1]
  if current_branch == nil or current_branch == '' then
    print("No current branch found")
    return
  end
  local command = string.format("Git push --set-upstream origin %s", current_branch)

  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":<C-U>" .. command, true, false, true), 'n', true)
end

function prepareToAmend()
  local current_branch = vim.fn.systemlist("git branch --show-current")[1]
  if current_branch == nil or current_branch == '' then
    print("No current branch found")
    return
  end
  local command = "Git commit --amend --no-edit"

  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":<C-U>" .. command, true, false, true), 'n', true)
end

vim.keymap.set('n', '<leader>hP', pushToUpstream, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ha', prepareToAmend, { noremap = true, silent = true })
