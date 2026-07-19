vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = "a:block,i:ver25"
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.undofile = true
vim.opt.winborder = "rounded"
vim.opt.wrap = false

vim.filetype.add { extension = { h = "c", hlsl = "hlsl" } }
for pattern, commentstring in pairs({
    c = "/* %s */",
    cpp = "/* %s */",
    hlsl = "/* %s */"
}) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = pattern,
        callback = function() vim.bo.commentstring = commentstring end
    })
end

vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("n", "grf", vim.lsp.buf.format)
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float)
vim.keymap.set("i", "<C-l>", function() vim.cmd ":nohlsearch" end)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.diagnostic.config { virtual_text = true }
vim.api.nvim_create_user_command("BDelete", function()
    if not pcall(vim.cmd, "bnext | bdelete #") then
        vim.cmd "bdelete"
    end
end, {})

do
    vim.pack.add { "folke/tokyonight.nvim" }
    require "tokyonight".setup { style = "night", transparent = true }
    vim.cmd.colorscheme "tokyonight"
    local fg = vim.api.nvim_get_hl(0, { name = "WinSeparator" }).fg
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = fg, bg = fg })
end

do
    vim.pack.add { "nvim-lualine/lualine.nvim" }
    require "lualine".setup {
        options = {
            component_separators = { left = "|", right = "|" },
            section_separators = { left = "", right = "" },
            globalstatus = true
        },
        sections = { lualine_c = { "buffers" }, lualine_x = { "filetype" } }
    }
end

if vim.fn.exepath "tree-sitter" ~= "" then
    vim.pack.add { "nvim-treesitter/nvim-treesitter" }
    require "nvim-treesitter".install {
        "bash",
        "c",
        "cmake",
        "cpp",
        "dart",
        "doxygen",
        "fish",
        "hlsl",
        "java",
        "latex",
        "lua",
        "markdown",
        "python"
    }
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {
            "c",
            "cmake",
            "cpp",
            "dart",
            "fish",
            "hlsl",
            "java",
            "lua",
            "markdown",
            "python",
            "sh",
            "tex"
        },
        callback = function() vim.treesitter.start() end
    })
end

do
    vim.pack.add { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "lewis6991/gitsigns.nvim" }
    local telescope = require "telescope"
    telescope.setup {
        pickers = {
            find_files = { hidden = true },
            live_grep = { glob_pattern = "!.git", additional_args = { "-U." } }
        }
    }
    local telescope_builtin = require "telescope.builtin"
    local telescope_utils = require "telescope.utils"
    vim.keymap.set("n", "<Leader><Leader>", function()
        telescope_builtin.buffers { ignore_current_buffer = true, sort_mru = true }
    end)
    vim.keymap.set("n", "<Leader>s", function() vim.o.spell = not vim.o.spell end)
    vim.keymap.set("n", "<Leader>S", telescope_builtin.spell_suggest)
    vim.keymap.set("n", "<Leader>D", telescope_builtin.diagnostics)
    vim.keymap.set("n", "<Leader>f", telescope_builtin.find_files)
    vim.keymap.set("n", "<Leader>F", function()
        telescope_builtin.find_files { cwd = telescope_utils.buffer_dir() }
    end)
    if vim.fn.exepath "rg" == "" then
        vim.keymap.set("n", "<Leader>g", telescope_builtin.current_buffer_fuzzy_find)
        vim.keymap.set("n", "<Leader>G", telescope_builtin.current_buffer_fuzzy_find)
    else
        vim.keymap.set("n", "<Leader>g", telescope_builtin.live_grep)
        vim.keymap.set("n", "<Leader>G", function()
            telescope_builtin.live_grep { cwd = telescope_utils.buffer_dir() }
        end)
    end
    local gitsigns = require "gitsigns"
    gitsigns.setup {
        on_attach = function()
            vim.keymap.set("n", "<Leader>hs", gitsigns.stage_hunk)
            vim.keymap.set("n", "<Leader>hu", gitsigns.undo_stage_hunk)
            vim.keymap.set("n", "<Leader>hr", gitsigns.reset_hunk)
            vim.keymap.set("n", "<Leader>hS", gitsigns.stage_buffer)
            vim.keymap.set("n", "<Leader>hR", gitsigns.reset_buffer)
            vim.keymap.set("n", "<Leader>hd", gitsigns.preview_hunk_inline)
            vim.keymap.set("n", "<Leader>hb", gitsigns.blame_line)
        end
    }
end

do
    local cmp = require "cmp"
    cmp.setup {
        snippet = {
            expand = function(args)
                vim.snippet.expand(args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        mapping = {
            ["<C-u>"] = cmp.mapping.scroll_docs(-1),
            ["<C-d>"] = cmp.mapping.scroll_docs(1),
            ["<C-f>"] = cmp.mapping.confirm { select = true },
            ["<C-Up>"] = cmp.mapping.select_prev_item(),
            ["<C-Down>"] = cmp.mapping.select_next_item(),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item()
        },
        sources = cmp.config.sources(
            { { name = "nvim_lsp" } },
            { { name = "nvim_lsp_signature_help" } },
            { { name = "buffer" } },
            { { name = "path" } }
        )
    }
    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } }
    })
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            { { name = "path" } },
            { { name = "cmdline" } }
        )
    })
end

do
    vim.pack.add { "williamboman/mason.nvim", "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" }
    local servers = { jdtls = {}, lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } } }
    require "mason".setup { ui = { border = "rounded" } }
    require "mason-lspconfig".setup { ensure_installed = vim.tbl_keys(servers) }
    for server, config in pairs(servers) do vim.lsp.config[server] = config end
    if vim.fn.exepath "clangd" ~= "" then
        vim.lsp.config("clangd", { cmd = { "clangd", "--header-insertion=never" } })
        vim.lsp.enable "clangd"
    end
end

do
    vim.pack.add { "akinsho/toggleterm.nvim" }
    local terminals = {}
    local id
    local config = {
        on_create = function()
            vim.keymap.set("n", "<Escape>", "<Cmd>close<CR>", { buf = 0 })
            vim.keymap.set("n", "q", function()
                terminals[tonumber(string.match(vim.api.nvim_buf_get_name(0), "toggleterm#(%d+)"))]:shutdown()
            end, { buf = 0 })
        end,
        on_open = function() id = tonumber(string.match(vim.api.nvim_buf_get_name(0), "toggleterm#(%d+)")) end,
        highlights = { FloatBorder = { guifg = vim.api.nvim_get_hl(0, { name = "FloatBorder" }).fg } },
        persist_mode = false,
        direction = "float",
        float_opts = { border = "rounded" }
    }
    local terminal = require "toggleterm.terminal".Terminal;
    for i = 1, 9, 1 do
        vim.keymap.set("n", "<C-s>" .. i, function()
            if terminals[i] == nil then terminals[i] = terminal:new(vim.tbl_extend("force", config, { id = i })) end
            terminals[i]:open()
        end)
    end
    vim.keymap.set("n", "<C-s>s", function() if id ~= nil then terminals[id]:open() end end)
end

do
    vim.pack.add { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim", "flutter-tools.nvim" }
    require "flutter-tools".setup()
end

if vim.fn.exepath "claude" ~= "" then
    vim.pack.add { "coder/claudecode.nvim" }
    require "claudecode".setup {
        terminal_cmd = "ollama launch claude",
        diff_opts = { layout = "horizontal", open_in_new_tab = true }
    }
    vim.keymap.set("n", "<Leader>a", "<Cmd>ClaudeCode<CR>")
end
