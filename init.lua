require("config.lazy")
--vim.cmd [[packadd packer.nvim]]

--local startup = require("packer").startup

--startup(function(use)
  ---- language server configurations
  --use 'wbthomason/packer.nvim'
  --use({ "elixir-tools/elixir-tools.nvim", requires = { "nvim-lua/plenary.nvim" }})
  --use "neovim/nvim-lspconfig"
  --use "hrsh7th/cmp-nvim-lsp"
  --use "hrsh7th/cmp-buffer"
  --use "hrsh7th/nvim-cmp"
  --use "hrsh7th/cmp-vsnip"
  ----use "hrsh7th/vim-vsnip"
  --use({
    --"L3MON4D3/LuaSnip",
    ---- follow latest release.
    --tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    ---- install jsregexp (optional!:).
    --run = "make install_jsregexp"
  --})
  --use "saadparwaiz1/cmp_luasnip"

  --use "overcache/NeoSolarized"
  --use "jeffkreeftmeijer/vim-numbertoggle"
  --use "kana/vim-textobj-user"
  --use "tpope/vim-abolish"
  --use "tpope/vim-surround"
  --use "tpope/vim-fugitive"
  --use "jeetsukumaran/vim-indentwise"
  --use "michaeljsmith/vim-indent-object"
  --use "scrooloose/nerdcommenter"
  --use "godlygeek/tabular"
  --use "nvim-treesitter/nvim-treesitter"
  --use "nvim-treesitter/nvim-treesitter-textobjects"
  --use {
    --'kyazdani42/nvim-tree.lua',
    --requires = 'kyazdani42/nvim-web-devicons',
    --config = function() require'nvim-tree'.setup {} end
  --}
  --use {
    --'nvim-telescope/telescope.nvim',
    --requires = { {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzy-native.nvim'} }
  --}
  --use 'windwp/nvim-spectre'
  --use 'vim-test/vim-test'
  ----use 'elixir-editors/vim-elixir'
  --use 'tpope/vim-repeat'
  --use 'ggandor/lightspeed.nvim'
  ----use 'lukas-reineke/indent-blankline.nvim'
  --use 'kdheepak/lazygit.nvim'
  --use 'folke/zen-mode.nvim'
  --use 'rust-lang/rust.vim'
  --use 'rafamadriz/friendly-snippets'
  ----use 'github/copilot.vim'
  --use({
    --'mrjones2014/dash.nvim',
    --run = 'make install',
  --})
  --use 'andyl/vim-textobj-elixir'
  --use {
  --"folke/trouble.nvim",
  --requires = "kyazdani42/nvim-web-devicons",
  --config = function()
    --require("trouble").setup {
      ---- your configuration comes here
      ---- or leave it empty to use the default settings
      ---- refer to the configuration section below
      --position = "bottom", -- position of the list can be: bottom, top, left, right
      --height = 10, -- height of the trouble list when position is top or bottom
      --width = 50, -- width of the list when position is left or right
      --icons = true, -- use devicons for filenames
      --mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      --severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
      --fold_open = "", -- icon used for open folds
      --fold_closed = "", -- icon used for closed folds
      --group = true, -- group results by file
      --padding = true, -- add an extra new line on top of the list
      --cycle_results = true, -- cycle item list when reaching beginning or end of list
      --action_keys = { -- key mappings for actions in the trouble list
          ---- map to {} to remove a mapping, for example:
          ---- close = {},
          --close = "q", -- close the list
          --cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
          --refresh = "r", -- manually refresh
          --jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
          --open_split = { "<c-x>" }, -- open buffer in new split
          --open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
          --open_tab = { "<c-t>" }, -- open buffer in new tab
          --jump_close = {"o"}, -- jump to the diagnostic and close the list
          --toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
          --switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
          --toggle_preview = "P", -- toggle auto_preview
          --hover = "K", -- opens a small popup with the full multiline message
          --preview = "p", -- preview the diagnostic location
          --close_folds = {"zM", "zm"}, -- close all folds
          --open_folds = {"zR", "zr"}, -- open all folds
          --toggle_fold = {"zA", "za"}, -- toggle fold of current file
          --previous = "k", -- previous item
          --next = "j" -- next item
      --},
      --indent_lines = true, -- add an indent guide below the fold icons
      --auto_open = false, -- automatically open the list when you have diagnostics
      --auto_close = false, -- automatically close the list when you have no diagnostics
      --auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      --auto_fold = false, -- automatically fold a file trouble list at creation
      --auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
      --signs = {
        ---- icons / text used for a diagnostic
        --error = "",
        --warning = "",
        --hint = "",
        --information = "",
        --other = "",
      --},
      --use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    --}
  --end
  --}
  --use 'morhetz/gruvbox'
  --use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
--end)

--require("elixir").setup({
  --nextls = {
    --enable = true,
    --on_attach = function(client, bufnr)
      --vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      --vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      --vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    --end
  --},
  --credo = {enable = true},
  --elixirls = {enable = false},
--})

local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

elixir.setup {
  nextls = {
    enable = false, -- defaults to false
    port = 9001, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
    ----cmd = "/Users/thomas/Code/next-ls/bin/nextls", -- path to the executable. mutually exclusive with `port`
    ----version = "0.5.0", -- version of Next LS to install and use. defaults to the latest version
    --on_attach = function(client, bufnr)
      -- custom keybinds
      --vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      --vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      --vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    --end
  },
  credo = {
    --enable = true, -- defaults to true
    --port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
    --cmd = "path/to/credo-language-server", -- path to the executable. mutually exclusive with `port`
    --version = "0.1.0-rc.3", -- version of credo-language-server to install and use. defaults to the latest release
    on_attach = function(client, bufnr)
      -- custom keybinds
      --vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      --vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      --vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end
  },
  elixirls = {
    enable = true,
    -- specify a repository and branch
    --repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
    --branch = "mh/all-workspace-symbols", -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option
    -- tag = "v0.14.6", -- defaults to nil, mutually exclusive with the `branch` option

    -- alternatively, point to an existing elixir-ls installation (optional)
    -- not currently supported by elixirls, but can be a table if you wish to pass other args `{"path/to/elixirls", "--foo"}`
    --cmd = "/usr/local/bin/elixir-ls.sh",

    -- default settings, use the `settings` function to override settings
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = true,
      enableTestLenses = false,
      suggestSpecs = true,
    },
    on_attach = function(client, bufnr)
      -- custom keybinds
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end
  }
}

vim.cmd([[
  let mapleader = " "
  let test#strategy = "neovim"
  let test#elixir#runner = "ex_unit"
]])

local lspconfig = require("lspconfig")

lspconfig.pyright.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--lspconfig.efm.setup({
  --capabilities = capabilities,
  --on_attach = on_attach,
  --filetypes = {"elixir", "haskell"}
--})
require("codecompanion").setup({
  tools = {
    -- Include existing tools
    "cmd_runner",
    "editor",
    "files",
    -- Add your custom tool
    "pr_helper"
  },
  strategies = {
    chat = {
      adapter = "anthropic",
    },
    inline = {
      adapter = "anthropic",
    },
  },
  init = function()
    vim.cmd([[cab cc CodeCompanion]])
    require("legendary").keymaps({
      {
        itemgroup = "CodeCompanion",
        icon = "",
        description = "Use the power of AI...",
        keymaps = {
          {
            "<C-a>",
            "<cmd>CodeCompanionActions<CR>",
            description = "Open the action palette",
            mode = { "n", "v" },
          },
          {
            "<LocalLeader>a",
            "<cmd>CodeCompanionChat Toggle<CR>",
            description = "Toggle a chat buffer",
            mode = { "n", "v" },
          },
          {
            "ga",
            "<cmd>CodeCompanionChat Add<CR>",
            description = "Add selected text to a chat buffer",
            mode = { "n", "v" },
          },
        },
      },
    })
    require("plugins.custom.spinner"):init()
  end,
  opts = {
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = vim.env.ANTHROPIC_API_KEY or "",
          },
          schema = {
            model = {
              default = "claude-3-sonnet-20240229",
            },
          },
        })
      end,
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.7-sonnet",
            },
          },
        })
      end,
      --deepseek = function()
        --return require("codecompanion.adapters").extend("deepseek", {
          --env = {
            --api_key = "cmd:op read op://personal/DeepSeek_API/credential --no-newline",
          --},
        --})
      --end,
      --gemini = function()
        --return require("codecompanion.adapters").extend("gemini", {
          --env = {
            --api_key = "cmd:op read op://personal/Gemini_API/credential --no-newline",
          --},
        --})
      --end,
      --novita = function()
        --return require("codecompanion.adapters").extend("novita", {
          --env = {
            --api_key = "cmd:op read op://personal/Novita_API/credential --no-newline",
          --},
          --schema = {
            --model = {
              --default = function()
                --return "meta-llama/llama-3.1-8b-instruct"
              --end,
            --},
          --},
        --})
      --end,
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "llama3.1:latest",
            },
            num_ctx = {
              default = 20000,
            },
          },
        })
      end,
      --openai = function()
        --return require("codecompanion.adapters").extend("openai", {
          --opts = {
            --stream = true,
          --},
          --env = {
            --api_key = "cmd:op read op://personal/OpenAI_API/credential --no-newline",
          --},
          --schema = {
            --model = {
              --default = function()
                --return "gpt-4o"
              --end,
            --},
          --},
        --})
      --end,
      --xai = function()
        --return require("codecompanion.adapters").extend("xai", {
          --env = {
            --api_key = "cmd:op read op://personal/xAI_API/credential --no-newline",
          --},
        --})
      --end,
    },
    prompt_library = {
      ["Docusaurus"] = {
        strategy = "chat",
        description = "Write documentation for me",
        opts = {
          index = 11,
          is_slash_cmd = false,
          auto_submit = false,
          short_name = "docs",
        },
        references = {
          {
            type = "file",
            path = {
              "doc/.vitepress/config.mjs",
              "lua/codecompanion/config.lua",
              "README.md",
            },
          },
        },
        prompts = {
          {
            role = "user",
            content = [[I'm rewriting the documentation for my plugin CodeCompanion.nvim, as I'm moving to a vitepress website. Can you help me rewrite it?

I'm sharing my vitepress config file so you have the context of how the documentation website is structured in the `sidebar` section of that file.

I'm also sharing my `config.lua` file which I'm mapping to the `configuration` section of the sidebar.
]],
          },
        },
      },
      ["Test workflow"] = {
        strategy = "workflow",
        description = "Use a workflow to test the plugin",
        opts = {
          index = 4,
        },
        prompts = {
          {
            {
              role = "user",
              content = "Generate a Python class for managing a book library with methods for adding, removing, and searching books",
              opts = {
                auto_submit = false,
              },
            },
          },
          {
            {
              role = "user",
              content = "Write unit tests for the library class you just created",
              opts = {
                auto_submit = true,
              },
            },
          },
          {
            {
              role = "user",
              content = "Create a TypeScript interface for a complex e-commerce shopping cart system",
              opts = {
                auto_submit = true,
              },
            },
          },
          {
            {
              role = "user",
              content = "Write a recursive algorithm to balance a binary search tree in Java",
              opts = {
                auto_submit = true,
              },
            },
          },
          {
            {
              role = "user",
              content = "Generate a comprehensive regex pattern to validate email addresses with explanations",
              opts = {
                auto_submit = true,
              },
            },
          },
          {
            {
              role = "user",
              content = "Create a Rust struct and implementation for a thread-safe message queue",
              opts = {
                auto_submit = true,
              },
            },
          },
          {
            {
              role = "user",
              content = "Write a GitHub Actions workflow file for CI/CD with multiple stages",
              opts = {
                auto_submit = true,
              },
            },
          },
          {
            {
              role = "user",
              content = "Create SQL queries for a complex database schema with joins across 4 tables",
              opts = {
                auto_submit = true,
              },
            },
          },
          {
            {
              role = "user",
              content = "Write a Lua configuration for Neovim with custom keybindings and plugins",
              opts = {
                auto_submit = true,
              },
            },
          },
          {
            {
              role = "user",
              content = "Generate documentation in JSDoc format for a complex JavaScript API client",
              opts = {
                auto_submit = true,
              },
            },
          },
        },
      },
    },
    strategies = {
      chat = {
        adapter = "copilot",
        roles = {
          user = "olimorris",
        },
        keymaps = {
          send = {
            modes = {
              i = { "<C-CR>", "<C-s>" },
            },
          },
          completion = {
            modes = {
              i = "<C-x>",
            },
          },
        },
        slash_commands = {
          ["buffer"] = {
            opts = {
              keymaps = {
                modes = {
                  i = "<C-b>",
                },
              },
            },
          },
          ["help"] = {
            opts = {
              max_lines = 1000,
            },
          },
        },
        tools = {
          vectorcode = {
            description = "Run VectorCode to retrieve the project context.",
            callback = function()
              return require("vectorcode.integrations").codecompanion.chat.make_tool()
            end,
          },
        },
      },
      inline = { adapter = "copilot" },
    },
    display = {
      action_palette = {
        provider = "default",
      },
      chat = {
        -- show_references = true,
        -- show_header_separator = false,
        -- show_settings = false,
      },
      diff = {
        provider = "mini_diff",
      },
    },
  },
})
--})

local cmp = require'cmp'
local luasnip = require'luasnip'
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
      -- For `vsnip` user.
      --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
      --per_filetype = {
        --codecompanion = { "codecompanion" },
      --},
      { name = 'nvim_lsp' },
      --{ name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, 
    {
      { name = 'buffer' },
    })
})

luasnip.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  store_selection_keys="<TAB>"
  --ext_opts = {
    --[types.choiceNode] = {
      --active = {
        --virt_text = { { "<--", "Error" } },
      --}
    --}
  --}
}


vim.o.hidden=true
vim.api.nvim_command 'syntax enable'
vim.api.nvim_command 'set termguicolors'
vim.api.nvim_command 'colorscheme Gruvbox'
vim.api.nvim_command 'set nowrapscan'
vim.api.nvim_command 'set noswapfile'
vim.o.background='light'
--capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Setup lspconfig.
--local path_to_elixirls = vim.fn.expand("/Users/thomas/elixir-ls/release/language_server.sh")
--lspconfig.elixirls.setup {
  --cmd = {path_to_elixirls},
  ----capabilities = capabilities,
  --on_attach = on_attach
--}

lspconfig.hls.setup {
  cmd = { "haskell-language-server", "--lsp" },
  --filetypes = { "haskell", "lhaskell" },
  capabilities = capabilities,
  on_attach = on_attach
  --rootPatterns = { "hie.yaml", "*.cabal", "stack.yaml", "package.yaml", "cabal.project" }
}


vim.o.nu=true

----Search
vim.o.ignorecase=true
vim.o.incsearch=true
vim.o.ruler=true

----Indentation
vim.o.expandtab=true
vim.o.tabstop=2
vim.o.softtabstop=2
vim.o.shiftwidth=2
vim.o.copyindent=true
--
----Status Bar
vim.o.laststatus=2
----vim.o.listchars="tab:▸\ ,eol:¬,trail:."
vim.o.history=1000
----
------Allow copying
--vim.o.mouse=a
--
--
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.tmp")

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- Enable syntax highlighting
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- following options are the default

--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

--vim.opt.list = true
--vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")

--require("indent_blankline").setup {
  ----char = "│",
  --buftype_exclude = {"terminal"},
  ----space_char_blankline = " ",
  ----show_end_of_line = true,
  ----char_highlight_list = {
      ----"IndentBlanklineIndent1",
      ----"IndentBlanklineIndent2",
      ----"IndentBlanklineIndent3",
      ----"IndentBlanklineIndent4",
      ----"IndentBlanklineIndent5",
      ----"IndentBlanklineIndent6",
  ----},
--}
require'nvim-tree'.setup {
  respect_buf_cwd = true,
  create_in_closed_folder = false,
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  --auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  --update_to_buf_dir   = {
    ---- enable the feature
    --enable = true,
    ---- allow to open the tree if it was previously closed
    --auto_open = true,
  --},
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },
    renderer = {
      special_files = { ['README.md'] = true, ['Makefile'] = true, ['MAKEFILE'] = true }, --" List of filenames that gets highlighted with NvimTreeSpecialFile
      add_trailing = true,
      root_folder_modifier = ':~',
      group_empty = true,
      highlight_git = true,
      icons = {
        padding = ' ',
        symlink_arrow = ' >> ',
        show = {['git'] = true,
                ['folder'] = false,
                ['file'] = false,
                ['folder_arrow'] = false
        },
        glyphs = {
	     ['default'] = '',
	     ['symlink'] = '',
	     ['git'] = {
	       ['unstaged'] = "✗",
	       ['staged'] = "✓",
	       ['unmerged'] = "",
	       ['renamed'] = "➜",
	       ['untracked'] = "★",
	       ['deleted'] = "",
	       ['ignored'] = "◌"
	       },
	     ['folder'] = {
	       ['arrow_open'] = "",
	       ['arrow_closed'] = "",
	       ['default'] = "",
	       ['open'] = "",
	       ['empty'] = "",
	       ['empty_open'] = "",
	       ['symlink'] = "",
	       ['symlink_open'] = "",
	       }
     },
    },
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 5,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
  },
}

vim.cmd([[
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus and NvimTreeResize are also available if you need them

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue
]])
-- nvim tree config
vim.cmd([[
  nnoremap <C-p> :FuzzyOpen<CR>
]])

  --nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
vim.cmd([[
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({layout_strategy='horizontal',layout_config={width=0.9}})<cr>
  nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({layout_strategy='horizontal',layout_config={width=0.9}})<cr>
  nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers({layout_strategy='horizontal',layout_config={width=0.9}, sort_mru = true})<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
  nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
  nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string({type_filter = 'elixir'})<cr>
  nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
  nnoremap <leader>fc <cmd>lua require('telescope.builtin').commands()<cr>
  nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references({layout_strategy='horizontal',layout_config={width=0.9}})<cr>
  nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
  nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
]])

vim.cmd([[
  nnoremap <leader>S :lua require('spectre').open()<CR>
  nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
  vnoremap <leader>s :lua require('spectre').open_visual()<CR>
  "  search in current file
  nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
]])

function close_and_test_last()
  vim.cmd('w')
  local status, err = pcall(function() vim.cmd('+q') end)
  vim.cmd('TestLast')
end

function close_last()
  vim.cmd('+q')
end


vim.api.nvim_set_keymap('n', 't<C-l>', ':lua close_and_test_last()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 't<C-g>', ':lua close_last()<CR>', { noremap = true, silent = true })
vim.cmd([[
  nmap <silent> t<C-n> :TestNearest<CR>
  nmap <silent> t<C-f> :TestFile<CR>
  nmap <silent> t<C-s> :TestSuite<CR>
  nmap <silent> t<C-g> :TestVisit<CR>
]])

-- exit :terminal easier
vim.cmd([[
  if has('nvim')
    tmap <C-o> <C-\><C-n>
  endif
]])

-- exit nvim easier
vim.cmd([[
  if has('nvim')
    imap jj <Esc>
  endif
]])

local actions = require('telescope.actions')
require('telescope').setup({
  mappings = {
    i = {
      ["<esc>"] = actions.close
    }
  },
  extensions = {
    dash = {
      -- configure path to Dash.app if installed somewhere other than /Applications/Dash.app
      dash_app_path = '/Applications/Dash.app',
      -- search engine to fall back to when Dash has no results, must be one of: 'ddg', 'duckduckgo', 'startpage', 'google'
      search_engine = 'google',
      -- debounce while typing, in milliseconds
      debounce = 0,
      -- map filetype strings to the keywords you've configured for docsets in Dash
      -- setting to false will disable filtering by filetype for that filetype
      -- filetypes not included in this table will not filter the query by filetype
      -- check src/lua_bindings/dash_config_binding.rs to see all defaults
      -- the values you pass for file_type_keywords are merged with the defaults
      -- to disable filtering for all filetypes,
      -- set file_type_keywords = false
      file_type_keywords = {
        dashboard = false,
        NvimTree = false,
        TelescopePrompt = false,
        terminal = false,
        packer = false,
        -- a table of strings will search on multiple keywords
        javascript = { 'javascript', 'nodejs' },
        typescript = { 'typescript', 'javascript', 'nodejs' },
        typescriptreact = { 'typescript', 'javascript', 'react' },
        javascriptreact = { 'javascript', 'react' },
        -- you can also do a string, for example,
        -- sh = 'bash'
      },
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
})

require('telescope').load_extension('fzf')

vim.cmd([[ set nohlsearch ]])

--vim.cmd([[ imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>' ]])

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}


vim.keymap.set({ "i", "s", "v" }, "<c-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    print("not expandable")
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i" }, "<c-l>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true })

--vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/snippets/all.lua<CR>")

--vim.keymap.set({ "n" }, "<leader><leader>k", function()
  --require'luasnip.loaders'.edit_snippet_files({})
--end, { silent = true})

local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node
local f = luasnip.function_node
--local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets("all", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	})
})

luasnip.add_snippets("all", {
	s("expand", t("this is what expanded"))
})

--luasnip.add_snippets("elixir", {
--})

local luasnip_loaders = require'luasnip.loaders.from_lua'
luasnip_loaders.load({paths = "~/Code/.dotfiles/snippets"})

local Job = require 'plenary.job'
vim.keymap.set("n", "ior", function()
  --:!rg -l 'IO.inspect' '/Users/thomas/Code/halo' | xargs gsed -i '/IO.inspect/d'
  local results = {}  
  local rg_job =
    Job:new({
      command = 'rg',
      args = { '-l', 'IO.inspect', '/Users/thomas/Code/securitytrails_api', '|', 'xargs', 'gsed', '-i ', '"/IO.inspect/d"'},
      on_stdout = function(_, val)
        table.insert(results, val)
      end
    }):sync()

  --for key, val in ipairs(results) do
    --print(key)
    --print(val)
    --local gsed_job =
      --Job:new({
        --command = 'gsed', 
        --args = { '-i', 'IO.inspect/d', val },
        --on_stdout = function(_, val)
          --print(val)
        --end
      --}):sync()
    --print(gsed_job:result())
  --end
end, { silent = true })

--Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
--"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
--"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
vim.cmd([[
  if (empty($TMUX))
    if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif
]])

vim.cmd([[
  nnoremap <leader>c :let @+=expand('%:p')<cr>
]])

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end


-- here some of my mappings:
-- jump to the last changed spot
--map("n", "gl", "`.", { desc = "Jump to the last change in the file"})
--map("i", "<LeftMouse>", '<C-o>:normal "*gp<CR>', { desc = "Use left mouse to paste primary selection in insert mode"})
--map("i", "<RightMouse>", '<C-o>:normal "+gp<CR>', { desc = "Use right mouse to paste clipboard + in insert mode"})

---- line text-objects (inner and whole line text-objects)
---- I am trying now to create some "inner next object", "around last object" and
---- these mappings conflict with the mappings bellow, so, I am disabling those for a while
--map("x", "al", ":<C-u>norm! 0v$<cr>", { desc = "Line text object" })
--map("x", "il", ":<C-u>norm! _vg_<cr>", { desc = "Line text object" })
--map("o", "al", ":<C-u>norm! 0v$<cr>", { desc = "Line text object" })
--map("o", "il", ":<C-u>norm! _vg_<cr>", { desc = "Line text object" })
