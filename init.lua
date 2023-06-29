vim.cmd [[packadd packer.nvim]]

local startup = require("packer").startup

startup(function(use)
  -- language server configurations
  use 'wbthomason/packer.nvim'
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-vsnip"
  --use "hrsh7th/vim-vsnip"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"


  use "overcache/NeoSolarized"
  use "jeffkreeftmeijer/vim-numbertoggle"
  use "kana/vim-textobj-user"
  use "tpope/vim-abolish"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"
  use "jeetsukumaran/vim-indentwise"
  use "michaeljsmith/vim-indent-object"
  use "scrooloose/nerdcommenter"
  use "godlygeek/tabular"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzy-native.nvim'} }
  }
  use 'windwp/nvim-spectre'
  use 'vim-test/vim-test'
  use 'elixir-editors/vim-elixir'
  use 'tpope/vim-repeat'
  use 'ggandor/lightspeed.nvim'
  --use 'lukas-reineke/indent-blankline.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'folke/zen-mode.nvim'
  use 'rust-lang/rust.vim'
  use 'rafamadriz/friendly-snippets'
  --use 'github/copilot.vim'
  use({
    'mrjones2014/dash.nvim',
    run = 'make install',
  })
  use 'andyl/vim-textobj-elixir'
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
  use 'morhetz/gruvbox'
end)

vim.cmd([[
  let mapleader = " "
  let test#strategy = "neovim"
  let test#elixir#runner = "ex_unit"
]])

local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.get()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  buf_set_keymap('n', '<space>ss', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

end

--lspconfig.efm.setup({
  --capabilities = capabilities,
  --on_attach = on_attach,
  --filetypes = {"elixir", "haskell"}
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
      { name = 'nvim_lsp' },
      --{ name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
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
vim.api.nvim_command 'colorscheme NeoSolarized'
vim.api.nvim_command 'set nowrapscan'
vim.api.nvim_command 'set noswapfile'
vim.o.background='light'
--capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Setup lspconfig.
local path_to_elixirls = vim.fn.expand("/Users/thomas/elixir-ls/release/language_server.sh")
lspconfig.elixirls.setup {
  cmd = {path_to_elixirls},
  --capabilities = capabilities,
  on_attach = on_attach
}

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
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
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
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
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
      highlight_opened_files = ';)', 
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
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    },
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
  nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  nnoremap <leader>fa <cmd>lua require('telescope.builtin').find_files({cwd = '/Users/thomas/Code/halo/lib/halo_web/absinthe'})<cr>
  nnoremap <leader>t <cmd>lua require('telescope.builtin').find_files({cwd = '/Users/thomas/Code/halo/test/halo_web/absinthe'})<cr>
  nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers({sort_mru = true})<cr>
  nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
  nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
  nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
  nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
  nnoremap <leader>fc <cmd>lua require('telescope.builtin').commands()<cr>
  nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
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

vim.cmd([[
  nmap <silent> t<C-n> :TestNearest<CR>
  nmap <silent> t<C-f> :TestFile<CR>
  nmap <silent> t<C-s> :TestSuite<CR>
  nmap <silent> t<C-l> :TestLast<CR>
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

require('telescope').load_extension('fzy_native')

local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
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
        fzf = false,
        -- a table of strings will search on multiple keywords
        javascript = { 'javascript', 'nodejs' },
        typescript = { 'typescript', 'javascript', 'nodejs' },
        typescriptreact = { 'typescript', 'javascript', 'react' },
        javascriptreact = { 'javascript', 'react' },
        -- you can also do a string, for example,
        -- sh = 'bash'
      },
    }
  },
})

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

vim.keymap.set({ "n" }, "<leader><leader>k", function()
  require'luasnip.loaders'.edit_snippet_files({})
end, { silent = true})

local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node
local f = luasnip.function_node

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
luasnip_loaders.load({paths = "~/snippets"})

local Job = require 'plenary.job'
vim.keymap.set("n", "ior", function()
  --:!rg -l 'IO.inspect' '/Users/thomas/Code/halo' | xargs gsed -i '/IO.inspect/d'
  local results = {}  
  local rg_job =
    Job:new({
      command = 'rg',
      args = { '-l', 'IO.inspect', '/Users/thomas/Code/halo', '|', 'xargs', 'gsed', '-i ', '"/IO.inspect/d"'},
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
