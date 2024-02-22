local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
  'volar',
  'typst_lsp'
})


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

local cmp = require('cmp')

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
  })
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["rust_analyzer"] = {"rust"}
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
