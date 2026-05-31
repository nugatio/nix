local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
  config.disable_default_key_bindings = true

  config.enable_kitty_keyboard = true

  config.keys = {
    {
      key = 'Backspace',
      mods = 'OPT',
      action = wezterm.action.SendString '\x1b\x7f',
    },

    -- { key = 'c', mods = 'CMD', action = wezterm.action.CopyTo 'Clipboard' },
    -- { key = 'v', mods = 'CMD', action = wezterm.action.PasteFrom 'Clipboard' },
  }
end

return module
