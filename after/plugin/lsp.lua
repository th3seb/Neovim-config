local lsp = require('lsp-zero')
lsp.preset("recommended")
require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'tsserver', 'rust_analyzer'},
})
  lsp.set_preferences({
	  sign_icons = {
		  error = 'E',
		  warn = 'W',
		  hint = 'H',
		  info = 'I'
	  }
  })

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.decleration() end, opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		["<C-Space>"] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})



local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['lua_ls'].setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim'}
			}
		}
	}
}

require('lspconfig')['tsserver'].setup {
	capabilities = capabilities
}
require('lspconfig')['eslint'].setup {
	capabilities = capabilities
}
require('lspconfig')['tailwindcss'].setup {
	capabilities = capabilities
}
require('lspconfig')['bashls'].setup {
	capabilities = capabilities
}
require('lspconfig')['rust_analyzer'].setup {
	capabilities = capabilities
}
require('lspconfig')['cssls'].setup {
	capabilities = capabilities
}
require('lspconfig')['dockerls'].setup {
	capabilities = capabilities
}
require('lspconfig')['ltex'].setup {
	capabilities = capabilities
}
require('lspconfig')['html'].setup {
	capabilities = capabilities
}
require('lspconfig')['yamlls'].setup {
	capabilities = capabilities
}
require('lspconfig')['jsonls'].setup {
	capabilities = capabilities
}

require('lspconfig')['prettier'].setup {
    filetypes = {"javascript", "typescript", "typescriptreact", "typescript.tsx", "javascriptreact", "css", "scss", "json", "graphql", "markdown", "vue", "html", "yaml", "markdown"},
    bin = "prettier",
	capabilities = capabilities
}

