-- nb@2026.05.31

local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)

  -- ////////// WINDOW DECOR & TITLEBAR //////////

  config.window_decorations = "RESIZE"


  -- ////////// CLEAN TERMINAL TAB BAR //////////

  config.enable_tab_bar = true
  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = false
  config.tab_bar_at_bottom = false
  config.show_new_tab_button_in_tab_bar = false


  -- ////////// FONT & TEXT RENDERING //////////

  config.font = wezterm.font("PragmataPro VF Mono Liga", { weight = 450 })
  config.font_rules = {
    {
      intensity = "Bold",
      italic = false,
      font = wezterm.font("PragmataPro VF Mono Liga", { weight = 750 }),
    },
    {
      intensity = "Normal",
      italic = true,
      font = wezterm.font("PragmataPro VF Mono Liga", { weight = 450, italic = true }),
    },
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font("PragmataPro VF Mono Liga", { weight = 750, italic = true }),
    },
  }
  config.font_size = 13.0
  config.harfbuzz_features = { "kern", "calt", "clig", "liga", "dlig" }

  config.bold_brightens_ansi_colors = false


  -- ////////// CURSOR & MOUSE //////////

  config.default_cursor_style = "BlinkingBlock"
  config.cursor_blink_rate = 800
  config.cursor_blink_ease_in = "Constant"
  config.cursor_blink_ease_out = "Constant"

  config.force_reverse_video_cursor = true

  config.hide_mouse_cursor_when_typing = true


  -- ////////// WINDOW LAYOUT & PADDING //////////

  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }

  config.use_resize_increments = false


  -- ////////// COLOR PALETTE (Rosé Pine Moon) //////////

  config.colors = {
    background = "#232136",
    foreground = "#e0def4",
    selection_bg = "#44415a",
    selection_fg = "#e0def4",
    cursor_bg = "#56526e",
    cursor_fg = "#232136",

    ansi = {
      "#2a273f", "#eb6f92", "#3e8fb0", "#f6c177",
      "#9ccfd8", "#c4a7e7", "#ea9a97", "#e0def4"
    },
    brights = {
      "#6e6a86", "#eb6f92", "#3e8fb0", "#f6c177",
      "#9ccfd8", "#c4a7e7", "#ea9a97", "#e0def4"
    },

    tab_bar = {
      background = "#232136",

      active_tab = {
        bg_color = "#ea9a97",
        fg_color = "#232136",
      },

      inactive_tab = {
        bg_color = "#9ccfd8",
        fg_color = "#e0def4",
      },
      inactive_tab_hover = {
        bg_color = "#9ccfd8",
        fg_color = "#e0def4",
      },

      new_tab = {
        bg_color = "#9ccfd8",
        fg_color = "#232136",
      },
      new_tab_hover = {
        bg_color = "#9ccfd8",
        fg_color = "#232136",
      },
    }
  }
end

return module
