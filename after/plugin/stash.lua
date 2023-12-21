-- Function to run the 'git stash -m <name>' command
local function stash(name)
  local command = "Git stash -m " .. name
  vim.api.nvim_command(command)
end

local function stashApply(name)
  local stashName = string.match(name, "([^:]+)")
  local command = "Git stash apply " .. stashName
  vim.api.nvim_command(command)
end

local function stashPop(name)
  local stashName = string.match(name, "([^:]+)")
  local command = "Git stash pop " .. stashName
  vim.api.nvim_command(command)
end

-- Function to provide autocomplete for StashApply and StashPop command
local function stashApplyComplete(ArgLead, CmdLine, CursorPos)
  local handle = io.popen("git stash list")
  local result = handle:read("*a")
  handle:close()

  local stashes = {}
  for stash in string.gmatch(result, "[^\r\n]+") do
    table.insert(stashes, stash)
  end

  return stashes
end


vim.api.nvim_create_user_command('Stash', function(input)
  stash(input.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command('StashApply', function(input)
  stashApply(input.args)
end, { nargs = 1, complete = stashApplyComplete })

vim.api.nvim_create_user_command('StashPop', function(input)
  stashPop(input.args)
end, { nargs = 1, complete = stashApplyComplete })
