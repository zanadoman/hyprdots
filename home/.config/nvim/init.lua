vim.g.mapleader = " "
vim.o.autocomplete = true
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "fuzzy,menuone,noinsert,nosort"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.exrc = true
vim.o.guicursor = "a:block,i:ver25,t:ver25,r:hor25"
vim.o.mouse = ""
vim.o.number = true
vim.o.pumborder = "rounded"
vim.o.pumheight = 10
vim.o.pummaxwidth = 50
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.winborder = "rounded"
vim.o.wrap = false

vim.api.nvim_create_autocmd("FileType", { callback = function() vim.o.shiftwidth = 2 end, pattern = "dart" })
vim.diagnostic.config { severity_sort = true, virtual_text = true }
vim.keymap.set("i", "<C-f>", function() return vim.fn.pumvisible() == 0 and "<C-f>" or "<C-y>" end, { expr = true })
vim.keymap.set("i", "<C-y>", function() return vim.fn.pumvisible() == 0 and "<C-y>" or "<C-e><C-y>" end, { expr = true })
vim.keymap.set("i", "<CR>", function() return vim.fn.pumvisible() == 0 and "<CR>" or "<C-e><CR>" end, { expr = true })
vim.keymap.set("i", "<Down>", function() return vim.fn.pumvisible() == 0 and "<Down>" or "<C-e><Down>" end, { expr = true })
vim.keymap.set("i", "<Up>", function() return vim.fn.pumvisible() == 0 and "<Up>" or "<C-e><Up>" end, { expr = true })
vim.keymap.set("n", "<Leader>", function() end)
vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("n", "grf", vim.lsp.buf.format)
vim.keymap.set("n", "q<C-w>d", vim.diagnostic.setqflist)
vim.keymap.set("t", "<Esc><Esc>", "<Cmd>stopinsert<CR>")
for pattern, commentstring in pairs { wgsl = "// %s" } do
    vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev) vim.bo[ev.buf].commentstring = commentstring end,
        pattern = pattern
    })
end

local notify = vim.notify
vim.notify = function(msg, level, opts) notify(msg, level == vim.log.levels.ERROR and vim.log.levels.WARN or level, opts) end

if vim.fn.exepath "git" ~= "" then
    vim.pack.add { "https://github.com/nvim-lualine/lualine.nvim" }
    require "lualine".setup {
        options = { component_separators = { left = "|", right = "|" }, section_separators = { left = "", right = "" }, globalstatus = true },
        sections = { lualine_c = { "buffers" }, lualine_x = { "filetype" } }
    }
end

if vim.fn.exepath "git" ~= "" then
    vim.pack.add { "https://github.com/folke/tokyonight.nvim" }
    require "tokyonight".setup {
        style = "night",
        transparent = not vim.env.TERM_PROGRAM or vim.env.TERM_PROGRAM == "tmux",
        styles = { comments = { italic = false }, keywords = { italic = false } },
        on_highlights = function(highlights, colors)
            highlights.PmenuBorder = { bg = colors.bg_dark, fg = colors.border_highlight }
            highlights.TabLineFill = { bg = colors.bg_dark }
            highlights.WinSeparator = { bg = colors.bg_dark, fg = colors.bg_dark }
        end
    }
    vim.cmd.colorscheme "tokyonight"
end

if vim.fn.exepath "git" ~= "" and vim.fn.exepath "curl" ~= "" and vim.fn.exepath "tar" ~= "" and vim.fn.exepath "cc" ~= "" and vim.fn.exepath "tree-sitter" ~= "" then
    vim.pack.add { "https://github.com/nvim-treesitter/nvim-treesitter" }
    require "nvim-treesitter".install { "dart", "lua", "rust", "wgsl" }
    vim.api.nvim_create_autocmd("FileType", {
        callback = function() vim.treesitter.start() end,
        pattern = { "dart", "lua", "rust", "wgsl" }
    })
end

if vim.fn.exepath "git" ~= "" then
    vim.pack.add { "https://github.com/williamboman/mason.nvim", "https://github.com/neovim/nvim-lspconfig", "https://github.com/williamboman/mason-lspconfig.nvim" }
    require "mason".setup()
    require "mason-lspconfig".setup { ensure_installed = { "lua_ls", "rust_analyzer" } }
    vim.lsp.config("*", { capabilities = vim.lsp.protocol.make_client_capabilities() })
    vim.lsp.enable "dartls"
    vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
    vim.lsp.config("rust_analyzer", { settings = { ["rust-analyzer"] = { check = { command = "clippy" } } } })
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
            if vim.lsp.get_client_by_id(ev.data.client_id):supports_method "textDocument/completion" then
                vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
                vim.bo[ev.buf].complete = "o"
            end
        end,
    })
end

if vim.fn.exepath "git" ~= "" and vim.fn.exepath "flutter" ~= "" then
    vim.pack.add { "https://github.com/nvim-lua/plenary.nvim", "https://github.com/mfussenegger/nvim-dap", "https://github.com/zanadoman/flutter-tools.nvim" }
    require "flutter-tools".setup { debugger = { enabled = true }, dev_log = { enabled = false }, dev_tools = { autostart = true, auto_open_browser = true } }
end

if vim.fn.exepath "git" ~= "" and vim.fn.exepath "fzf" ~= "" then
    vim.pack.add { "https://github.com/ibhagwan/fzf-lua" }
    local FzfLua = require "fzf-lua"
    vim.keymap.set("n", "<Leader><Leader>", function() FzfLua.combine { pickers = "buffers;oldfiles" } end)
    vim.keymap.set("n", "<Leader>f", FzfLua.files)
    vim.keymap.set("n", "<Leader>F", function() FzfLua.files { cwd = vim.fn.expand "%:p:h" } end)
    vim.keymap.set("n", "<Leader>g", function() FzfLua.live_grep { cwd = vim.fn.getcwd(), resume = true } end)
    vim.keymap.set("n", "<Leader>G", function() FzfLua.live_grep { cwd = vim.fn.expand "%:p:h", resume = true } end)
end

if vim.fn.exepath "git" ~= "" then
    vim.pack.add { "https://github.com/lewis6991/gitsigns.nvim" }
    local gitsigns = require "gitsigns"
    gitsigns.setup {
        on_attach = function(bufnr)
            vim.keymap.set("n", "<Leader>hs", gitsigns.stage_hunk, { buf = bufnr })
            vim.keymap.set("n", "<Leader>hr", gitsigns.reset_hunk, { buf = bufnr })
            vim.keymap.set("v", "<Leader>hs", function() gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" } end)
            vim.keymap.set("v", "<Leader>hr", function() gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" } end)
            vim.keymap.set("n", "<Leader>hS", gitsigns.stage_buffer, { buf = bufnr })
            vim.keymap.set("n", "<Leader>hR", gitsigns.reset_buffer, { buf = bufnr })
            vim.keymap.set("n", "<Leader>hb", gitsigns.blame_line, { buf = bufnr })
            vim.keymap.set("n", "<Leader>hd", gitsigns.preview_hunk_inline, { buf = bufnr })
            vim.keymap.set("n", "<Leader>hD", function()
                vim.cmd "tab split"
                gitsigns.diffthis()
            end, { buf = bufnr })
            vim.keymap.set("n", "<Leader>hQ", function() gitsigns.setqflist "all" end, { buf = bufnr })
            vim.keymap.set("n", "<Leader>hq", gitsigns.setqflist, { buf = bufnr })
        end
    }
end

if vim.fn.exepath "git" ~= "" and vim.fn.exepath "claude" ~= "" then
    vim.pack.add { "https://github.com/coder/claudecode.nvim" }
    require "claudecode".setup { terminal = { provider = "none" }, diff_opts = { open_in_new_tab = true } }
end
