local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },  -- For luasnip
    }, {
        { name = 'buffer' },
    }),

    formatting = {
        -- changing the order of fields so the icon is the first
        fields = {'menu', 'abbr', 'kind'},
        -- here is where the change happens
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
                nvim_lua = 'Π',
                maxwidth = 50,
                ellipsis_char = "...",
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
-- Modify the number of shown completion items
window = {
        completion = cmp.config.window.bordered({
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
            col_offset = -3,
            side_padding = 0,
            max_items = 5
        }),
        documentation = cmp.config.window.bordered(),
    },

    experimental = {
        ghost_text = true,
    },
})
