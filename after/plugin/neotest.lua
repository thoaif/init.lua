require('neotest').setup({

  adapters = {
    -- jest config
    require('neotest-jest')({

      jestCommand = "pnpm test --",

      jestConfigFile = function()
        local file = vim.fn.expand('%:p')
        if string.find(file, "/packages/") then
          return string.match(file, "(.-/[^/]+/)src") .. "jest.config.cjs"
        end

        return vim.fn.getcwd() .. "/jest.config.cjs"
      end,

      env = { CI = true },

      cwd = function()
        local file = vim.fn.expand('%:p')
        if string.find(file, "/packages/") then
          return string.match(file, "(.-/[^/]+/)src")
        end
        return vim.fn.getcwd()
      end,
    }),
  }
})


vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", {})
