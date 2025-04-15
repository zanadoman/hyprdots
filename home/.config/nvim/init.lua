vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = "a:block"
vim.opt.mouse = "";
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 2 ^ 32 / 2 - 1
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.winborder = "rounded"
vim.opt.wrap = false

vim.filetype.add {
    pattern = {
        [".*.axaml"] = { "xml", { priority = math.huge } },
        [".*.html"] = { "html", { priority = math.huge } },
        [".*.php"] = { "php", { priority = math.huge } }
    }
}

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("n", "grf", function()
    if vim.bo.filetype == "rust" then
        vim.cmd "silent !cargo fmt"
    else
        vim.lsp.buf.format()
    end
end)

vim.diagnostic.config { virtual_text = true }
vim.keymap.set("n", "L", vim.diagnostic.open_float)

local function setup_tokyonight_nvim()
    require "tokyonight".setup { style = "night" }
    vim.cmd.colorscheme "tokyonight"
    local win_separator = vim.api.nvim_get_hl(0, { name = "WinSeparator" })
    vim.api.nvim_set_hl(0, "WinSeparator", {
        fg = win_separator.fg,
        bg = win_separator.fg
    })
end

local function setup_lualine_nvim()
    require "lualine".setup {
        options = {
            component_separators = { left = "|", right = "|" },
            section_separators = { left = "", right = "" },
            globalstatus = true
        },
        sections = { lualine_c = { "buffers" }, lualine_x = { "filetype" } }
    }
end

local function setup_indent_blankline_nvim()
    require "ibl".setup { indent = { char = "." }, scope = { enabled = false } }
end

local function setup_nvim_treesitter()
    require "nvim-treesitter.configs".setup {
        ensure_installed = {
            "angular",
            "bash",
            "c",
            "c_sharp",
            "cmake",
            "cpp",
            "css",
            "dart",
            "doxygen",
            "fish",
            "html",
            "java",
            "javascript",
            "kotlin",
            "latex",
            "lua",
            "markdown",
            "pascal",
            "php",
            "printf",
            "python",
            "rust",
            "sql",
            "typescript",
            "xml"
        },
        highlight = { enable = true }
    }
end

local function setup_telescope_nvim()
    local telescope = require "telescope"
    telescope.setup {
        pickers = {
            find_files = { hidden = true },
            live_grep = { additional_args = { "-." } }
        }
    }
    local telescope_builtin = require "telescope.builtin"
    local telescope_utils = require "telescope.utils"
    vim.keymap.set("n", "<Leader><Leader>", function()
        telescope_builtin.buffers { ignore_current_buffer = true, sort_mru = true }
    end)
    vim.keymap.set("n", "<Leader>s", function() vim.o.spell = not vim.o.spell end)
    vim.keymap.set("n", "<Leader>S", telescope_builtin.spell_suggest)
    vim.keymap.set("n", "<Leader>d", telescope_builtin.diagnostics)
    vim.keymap.set("n", "<Leader>D", telescope_builtin.git_status)
    vim.keymap.set("n", "<Leader>f", telescope_builtin.find_files)
    vim.keymap.set("n", "<Leader>F", function()
        telescope_builtin.find_files { cwd = telescope_utils.buffer_dir() }
    end)
    vim.keymap.set("n", "<Leader>g", telescope_builtin.live_grep)
    vim.keymap.set("n", "<Leader>G", function()
        telescope_builtin.live_grep { cwd = telescope_utils.buffer_dir() }
    end)
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

local function setup_nvim_cmp()
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

local function setup_mason_lspconfig_nvim()
    require "mason".setup { ui = { border = "rounded" } }
    local servers = {
        angularls = {},
        clangd = { cmd = { "clangd", "--header-insertion=never" } },
        cssls = {},
        emmet_language_server = { filetypes = { "*" } },
        html = { filetypes = { "html", "javascript", "php", "rust", "typescript" } },
        intelephense = {},
        jdtls = {},
        kotlin_language_server = {},
        lemminx = {
            settings = {
                xml = {
                    catalogs = { vim.fn.stdpath "config" .. "/lemminx/catalog.xml" },
                    completion = { autoCloseTags = false },
                    validation = { noGrammar = "ignore" }
                }
            }
        },
        lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } },
        omnisharp = {},
        pyright = {},
        rust_analyzer = {
            settings = {
                ["rust-analyzer"] = {
                    check = { command = "clippy" },
                    diagnostics = { disabled = { "inactive-code" } }
                }
            }
        },
        ts_ls = {}
    }
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local lspconfig = require "lspconfig"
    require "mason-lspconfig".setup {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
            function(server)
                servers[server].capabilities = cmp_nvim_lsp.default_capabilities()
                lspconfig[server].setup(servers[server])
            end
        }
    }
    vim.keymap.set("n", "grs", ":LspStart<CR>")
    vim.keymap.set("n", "grh", ":LspStop<CR>")
end

local lazy_nvim_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazy_nvim_path) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazy_nvim_path
    }
end
vim.opt.rtp:prepend(lazy_nvim_path)
require "lazy".setup(
    {
        {
            "folke/tokyonight.nvim",
            lazy = false,
            config = setup_tokyonight_nvim
        },
        {
            "nvim-lualine/lualine.nvim",
            event = "VeryLazy",
            config = setup_lualine_nvim
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            event = "VeryLazy",
            config = setup_indent_blankline_nvim
        },
        {
            "nvim-treesitter/nvim-treesitter",
            event = "VeryLazy",
            config = setup_nvim_treesitter
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "lewis6991/gitsigns.nvim"
            },
            event = "VeryLazy",
            config = setup_telescope_nvim
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline"
            },
            event = { "CmdlineEnter", "InsertEnter" },
            config = setup_nvim_cmp
        },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                "williamboman/mason.nvim",
                "neovim/nvim-lspconfig"
            },
            lazy = false,
            config = setup_mason_lspconfig_nvim
        },
        {
            "nvim-flutter/flutter-tools.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            ft = "dart",
            config = true
        }
    },
    { ui = { border = "rounded" } }
)
