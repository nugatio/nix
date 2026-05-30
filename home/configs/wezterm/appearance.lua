local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
  -- ////////// WINDOW DECOR & TITLEBAR //////////

  -- ghostty: macos-titlebar-style = hidden
  config.window_decorations = "RESIZE"

  -- ////////// CLEAN TERMINAL TAB BAR //////////

  -- Retro/terminal style bar (not the native GUI fancy bar)
  config.enable_tab_bar = true
  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = false
  config.tab_bar_at_bottom = false
  config.show_new_tab_button_in_tab_bar = false

  -- ////////// FONT & TEXT RENDERING //////////

  -- ghostty: wght=450 regular, wght=750 bold, italics share the family
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

  -- ghostty: bold-is-bright = false
  config.bold_brightens_ansi_colors = false

  -- ////////// CURSOR & MOUSE //////////

  -- ghostty: cursor-style = block, cursor-style-blink = true
  config.default_cursor_style = "BlinkingBlock"
  config.cursor_blink_rate = 800
  -- Crisp on/off blink instead of the default fade
  config.cursor_blink_ease_in = "Constant"
  config.cursor_blink_ease_out = "Constant"

  -- ghostty: cursor-invert-fg-bg = true (overrides cursor_bg/cursor_fg below)
  config.force_reverse_video_cursor = true

  -- ghostty: mouse-hide-while-typing = true
  config.hide_mouse_cursor_when_typing = true

  -- ////////// WINDOW LAYOUT & PADDING //////////

  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }

  -- Fill the whole window; leftover partial-cell space is drawn as a
  -- background-colored border rather than snapping the window in cell steps.
  config.use_resize_increments = false

  -- ////////// COLOR PALETTE (Rosé Pine Moon) //////////

  config.colors = {
    background = "#232136",
    foreground = "#e0def4",
    selection_bg = "#44415a",
    selection_fg = "#e0def4",
    -- cursor_bg/cursor_fg are ignored while force_reverse_video_cursor is on
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

    -- Tab bar (retro style)
    tab_bar = {
      -- Bar background = zellij status-bar bg (bright_blue / teal)
      background = "#232136",

      -- Selected tab = starship git-status bg (cyan)
      active_tab = {
        bg_color = "#ea9a97",
        fg_color = "#232136",
      },

      -- Unselected tab = terminal background
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
