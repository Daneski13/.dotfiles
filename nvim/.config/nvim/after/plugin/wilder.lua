if vim.g.vscode then return end

local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })

local popup = wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		highlights = {
			border = 'Normal', -- highlight to use for the border
			accent = wilder.make_hl('WilderAccent', 'Pmenu',
				{ { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
		},
		border = 'rounded',
		-- Transparancy
		pumblend = 20,
		-- highlights
		highlighter = {
			wilder.basic_highlighter(),
			wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
			wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
			-- at https://github.com/romgrk/fzy-lua-native
		},
		left = { ' ', wilder.popupmenu_devicons() },
		right = { ' ', wilder.popupmenu_scrollbar() },
	})
)

local wild = wilder.wildmenu_renderer({
	highlighter = wilder.basic_highlighter(),
})

wilder.set_option('renderer', wilder.renderer_mux({
	[':'] = popup,
	['/'] = wild,
	['?'] = wild
}))


wilder.set_option('pipeline', {
	wilder.branch(
		wilder.python_file_finder_pipeline({
			file_command = function(ctx, arg)
				if string.find(arg, '.') ~= nil then
					return { 'fd', '-tf', '-H' }
				else
					return { 'fd', '-tf' }
				end
			end,
			dir_command = { 'fd', '-td' },
		}),
		wilder.substitute_pipeline({
			pipeline = wilder.python_search_pipeline({
				skip_cmdtype_check = 1,
				pattern = wilder.python_fuzzy_pattern({
					start_at_boundary = 0,
				}),
			}),
		}),
		wilder.cmdline_pipeline({
			fuzzy = 2,
			fuzzy_filter = wilder.lua_fzy_filter(),
		}),
		{
			wilder.check(function(ctx, x) return x == '' end),
			wilder.history(),
		},
		wilder.python_search_pipeline({
			pattern = wilder.python_fuzzy_pattern({
				start_at_boundary = 0,
			}),
		})
	),
})
