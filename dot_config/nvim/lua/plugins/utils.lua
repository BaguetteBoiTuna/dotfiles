return {
  -- Toggle Terminal
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = {
      { "<F4>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
    },
    opts = {
      open_mapping = [[<F4>]],
      direction = "float",
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },
  -- lazygit
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-j>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-i>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "c-\\", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    }
  },
  -- -- avante
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --           insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
  --  inc-rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        desc = "Incremental rename",
        mode = "n",
        noremap = true,
        expr = true,
      },
    },
    config = true,
  },
  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("obsidian").setup(
        {
          workspaces = {
            {
              name = "Obsidian",
              path = "~/Obsidian",
            },
          },
          completion = {

            nvim_cmp = true,
            min_chars = 2,
            new_note_location = "current_dir",
          },
          mappings = {},

          -- Function that adds the timestamp to the new note and formats its name
          note_id_func = function(title)
            local timestamp = os.date("%Y-%m-%d")
            local sanitizedTitle = title or "untitled"
            sanitizedTitle = sanitizedTitle:gsub("%s+", "-"):lower()
            return timestamp .. "-" .. sanitizedTitle
          end,

          -- Function that changes the appearance of the note links
          wiki_link_func = function(opts)
            if opts.id == nil then
              return string.format("[[%s]]", opts.label)
            elseif opts.label ~= opts.id then
              return string.format("[[%s|%s]]", opts.id, opts.label)
            else
              return string.format("[[%s]]", opts.id)
            end
          end,

          -- Function that formats the yaml frontmatter of the note
          -- it also automatically adds the directories as tags
          note_frontmatter_func = function(note)
            local out = { id = note.id, aliases = note.aliases, tags = {} }
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
              for k, v in pairs(note.metadata) do
                out[k] = v
              end
            end

            local filePath = note.path.filename
            local dirs = {}
            for dir in filePath:gmatch("([^/]+)") do
              table.insert(dirs, dir)
            end

            local obsidianIndex = -1
            for i, dir in ipairs(dirs) do
              if dir == "Obsidian" then
                obsidianIndex = i
                break
              end
            end

            if obsidianIndex ~= -1 then
              dirs = {unpack(dirs, obsidianIndex + 1)}
            end

            table.remove(dirs)
            out.tags = dirs

            return out
          end,

          -- templates = {
          --   subdir = "Templates",
          --   date_format = "%Y-%m-%d",
          --   time_format = "%H:%M",
          --   tags = "",
          --   substitutions = {
          --     yesterday = function()
          --       return os.date("%Y-%m-%d", os.time() - 86400)
          --     end,
          --     tomorrow = function()
          --       return os.date("%Y-%m-%d", os.time() + 86400)
          --     end,
          --   }
          -- },
          ui = {
            enabled = true,
          },
        }
      )
    end,
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
