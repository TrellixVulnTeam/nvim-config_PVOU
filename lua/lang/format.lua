require('formatter').setup({
	filetype = {
		javascript = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
					stdin = true
				}
			end
		},
		typescript = {
			-- prettier
			function ()
				return {
					exe = "prettier",
					args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
					stdin = true
				}
			end
		},
		rust = {
			-- Rustfmt
			function()
				return {
					exe = "rustfmt",
					args = {"--emit=stdout"},
					stdin = true
				}
			end
		},
	}
})

vim.api.nvim_exec([[
	augroup FormatAutogroup
		autocmd!
		autocmd BufWritePost *.js,*.ts FormatWrite
		autocmd BufWritePost *.rs FormatWrite
	augroup END
]], true)
