if vim.g.vscode then return end

local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })

local popup = wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
      border = 'Normal', -- highlight to use for the border
      accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
    },
    border = 'rounded',
    -- Transparancy
    pumblend = 20,
    -- highlights
    highlighter = {
      wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
      wilder.lua_fzy_highlighter(),   -- requires fzy-lua-native vim plugin found
                                      -- at https://github.com/romgrk/fzy-lua-native
    },
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
