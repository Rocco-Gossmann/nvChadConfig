-- here is an example Go configuration
--
-- This file must return a function
--
-- this function  s given access to nvChads lspconfig, 
--   as well as the default on_attach and capabilities
--   functions of nvChad
return function(lspconfig, on_attach, capabilities)

	lspconfig.gopls.setup{
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			gopls = {
				buildFlags = { "-tags=js,wasm" }
			}
		}
	}

end
