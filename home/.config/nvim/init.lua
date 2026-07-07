vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = "a:block,i:ver25"
vim.opt.mouse = "";
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.showtabline = vim.env.TMUX and 0 or 2
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

vim.pack.add {
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig"
}

do
    require "tokyonight".setup { style = "night", transparent = true }
    vim.cmd.colorscheme "tokyonight"
    local win_separator = vim.api.nvim_get_hl(0, { name = "WinSeparator" })
    vim.api.nvim_set_hl(0, "WinSeparator", {
        fg = win_separator.fg,
        bg = win_separator.fg
    })
end

do
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
    require "mason".setup { ui = { border = "rounded" } }
    local servers = {
        jdtls = {},
        lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } }
    }
    local cmp_nvim_lsp_capabilities = require "cmp_nvim_lsp".default_capabilities()
    for server, config in pairs(servers) do
        config.capabilities = cmp_nvim_lsp_capabilities
        vim.lsp.config[server] = config
    end
    if vim.fn.exepath "clangd" ~= "" then
        vim.lsp.config("clangd", { cmd = { "clangd", "--header-insertion=never" } })
        vim.lsp.enable "clangd"
    end
    require "mason-lspconfig".setup { ensure_installed = vim.tbl_keys(servers) }
    if vim.fn.exepath "dart" ~= "" then
        vim.lsp.config("dartls", { cmd = { "dart", "language-server" } })
        vim.lsp.enable "dartls"
    end
end
