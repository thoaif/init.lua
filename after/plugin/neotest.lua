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



-- run all tests in the file
vim.keymap.set("n", "<leader>tf", function() require('neotest').run.run(vim.fn.expand('%')) end, {})

-- run nearest test
vim.keymap.set("n", "<leader>tt", function() require('neotest').run.run() end, {})

-- debug nearest test
vim.keymap.set("n", "<leader>td", function() require('neotest').run.run({ strategy = "dap" }) end, {})

-- debug the current file
vim.keymap.set("n", "<leader>tF", function() require('neotest').run.run({ vim.fn.expand('%'), strategy = "dap" }) end, {})

-- attach to the neareast test
vim.keymap.set("n", "<leader>ta", function() require('neotest').run.attach() end, {})

-- toggle test summary
vim.keymap.set("n", "<leader>ts", function() require('neotest').summary.toggle() end, {})
