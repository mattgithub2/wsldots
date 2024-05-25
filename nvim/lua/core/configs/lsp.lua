local lsp_zero = require('lsp-zero')

lsp_zero.set_preferences({
  sign_icons = { }
})

lsp_zero.on_attach(function(client, bufnr)

  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls','clangd', 'rust_analyzer', 'eslint'},
  automatic_installation = true,

  handlers = {
    function(server_name)
      local opts = {}
  if server_name == "lua_ls" then
        opts.settings = {
          Lua = {
            diagnostics = {
              -- Tell the language server that `vim` is a global variable
              globals = {'vim'}
            },
            workspace = {
              -- Assuming your Neovim configuration files are in `~/.config/nvim`
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          }
        }
      end
      require('lspconfig')[server_name].setup(opts)
    end,
  },
})
-- Super tab configuration
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
