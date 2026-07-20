vim.g.mapleader = " "
vim.opt.autocomplete = true
vim.opt.clipboard = "unnamedplus"
vim.opt.complete = "o"
vim.opt.completeopt = "fuzzy,menuone,noinsert"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = "a:block,i:ver25"
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.pumborder = "rounded"
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

vim.keymap.set("i", "<Up>", function() return vim.fn.pumvisible() == 1 and "<C-e><Up>" or "<Up>" end, { expr = true })
vim.keymap.set("i", "<CR>", function() return vim.fn.pumvisible() == 1 and "<C-e><CR>" or "<CR>" end, { expr = true })
vim.keymap.set("i", "<Down>", function() return vim.fn.pumvisible() == 1 and "<C-e><Down>" or "<Down>" end, { expr = true })
vim.keymap.set("i", "<C-Up>", function() return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-Up>" end, { expr = true })
vim.keymap.set("i", "<C-k>", function() return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>" end, { expr = true })
vim.keymap.set("i", "<C-Down>", function() return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-Down>" end, { expr = true })
vim.keymap.set("i", "<C-j>", function() return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>" end, { expr = true })
vim.keymap.set("i", "<C-f>", function() return vim.fn.pumvisible() == 1 and "<C-y>" or "<C-f>" end, { expr = true })
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        end
    end
})

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
vim.diagnostic.config { virtual_text = true }
vim.api.nvim_create_user_command("BDelete", function() pcall(vim.cmd, "bnext | bdelete #") end, {})

do
    vim.pack.add { "https://github.com/folke/tokyonight.nvim" }
    require "tokyonight".setup { style = "night", transparent = true }
    vim.cmd.colorscheme "tokyonight"
    vim.api.nvim_set_hl(0, "Pmenu", vim.api.nvim_get_hl(0, { name = "Normal" }))
    vim.api.nvim_set_hl(0, "PmenuBorder", vim.api.nvim_get_hl(0, { name = "FloatBorder" }))
    local fg = vim.api.nvim_get_hl(0, { name = "WinSeparator" }).fg
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = fg, bg = fg })
end

do
    vim.pack.add { "https://github.com/nvim-lualine/lualine.nvim" }
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
    vim.pack.add { "https://github.com/nvim-treesitter/nvim-treesitter" }
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
    vim.pack.add {
        "https://github.com/nvim-telescope/telescope.nvim",
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/lewis6991/gitsigns.nvim"
    }
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
    vim.pack.add {
        "https://github.com/williamboman/mason.nvim",
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/williamboman/mason-lspconfig.nvim"
    }
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
    vim.pack.add { "https://github.com/akinsho/toggleterm.nvim" }
    local toggleterm = require "toggleterm.terminal"
    local timer = vim.uv:new_timer()
    local terminal
    local config = {
        on_create = function(t)
            vim.api.nvim_create_autocmd("BufEnter", {
                callback = function() t:set_mode(toggleterm.mode.INSERT) end,
                buf = 0
            })
            vim.keymap.set("t", "<Esc>", function()
                if timer:is_active() then
                    timer:stop()
                    return "<C-\\><C-n>"
                end
                timer:start(200, 0, function() end)
                return "<Esc>"
            end, { expr = true, buf = 0 })
            vim.keymap.set("n", "<Esc>", function() t:close() end)
            vim.keymap.set("n", "q", function() t:shutdown() end, { buf = 0 })
            vim.api.nvim_create_autocmd("BufLeave", { callback = function() t:close() end, buf = 0 })
        end,
        on_open = function(t) terminal = t end,
        highlights = { FloatBorder = { guifg = vim.api.nvim_get_hl(0, { name = "FloatBorder" }).fg } },
        direction = "float",
        float_opts = { border = "rounded" }
    }
    for i = 1, 9, 1 do
        local t
        vim.keymap.set("n", "<C-s>" .. i, function()
            if not t then t = toggleterm.Terminal:new(vim.tbl_extend("force", config, { id = i })) end
            t:open()
        end)
    end
    vim.keymap.set("n", "<C-s>0", function() if terminal then terminal:open() end end)
end

do
    vim.pack.add { "https://github.com/nvim-lua/plenary.nvim", "https://github.com/nvim-flutter/flutter-tools.nvim" }
    require "flutter-tools".setup { dev_log = { open_cmd = "tabnew" } }
end

if vim.fn.exepath "claude" ~= "" then
    vim.pack.add { "https://github.com/folke/snacks.nvim", "https://github.com/coder/claudecode.nvim" }
    require "claudecode".setup {
        terminal_cmd = "ollama launch claude",
        terminal = { auto_insert = true },
        diff_opts = { layout = "horizontal", open_in_new_tab = true }
    }
    vim.keymap.set("n", "<Leader>a", "<Cmd>ClaudeCode<CR>")
end
