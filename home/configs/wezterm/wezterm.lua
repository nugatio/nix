local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local appearance = require 'appearance'
local keys = require 'keys'

appearance.apply_to_config(config)
keys.apply_to_config(config)

return config
