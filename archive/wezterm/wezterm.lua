local wezterm = require('wezterm')

return {
  color_scheme = 'Smyck',
  font = wezterm.font('UbuntuMono Nerd Font', {weight='Regular'}),
  font_size = 9,
  tab_bar_at_bottom = true,
  unzoom_on_switch_pane = true,
  leader = { key=' ', mods='CTRL'},
  keys = {
    {key='c', mods='LEADER', action=wezterm.action{SplitHorizontal={domain='CurrentPaneDomain'}}},
    {key='C', mods='LEADER', action=wezterm.action{SplitVertical={domain='CurrentPaneDomain'}}},
    {key='1', mods='LEADER', action=wezterm.action{ActivateTab=0}},
    {key='2', mods='LEADER', action=wezterm.action{ActivateTab=1}},
    {key='3', mods='LEADER', action=wezterm.action{ActivateTab=2}},
    {key='4', mods='LEADER', action=wezterm.action{ActivateTab=3}},
    {key='5', mods='LEADER', action=wezterm.action{ActivateTab=4}},
    {key='6', mods='LEADER', action=wezterm.action{ActivateTab=5}},
    {key='7', mods='LEADER', action=wezterm.action{ActivateTab=6}},
    {key='8', mods='LEADER', action=wezterm.action{ActivateTab=7}},
    {key='9', mods='LEADER', action=wezterm.action{ActivateTab=8}},
    {key='0', mods='LEADER', action=wezterm.action{ActivateTab=9}},
    {key='Enter', mods='LEADER', action=wezterm.action{SpawnTab='CurrentPaneDomain'}},
    {key=' ', mods='LEADER|CTRL', action='ActivateLastTab'},
    {key='z', mods='LEADER', action='TogglePaneZoomState'},
    {key='h', mods='CTRL', action=wezterm.action{ActivatePaneDirection="Left"}},
    {key='j', mods='CTRL', action=wezterm.action{ActivatePaneDirection="Up"}},
    {key='k', mods='CTRL', action=wezterm.action{ActivatePaneDirection="Down"}},
    {key='l', mods='CTRL', action=wezterm.action{ActivatePaneDirection="Right"}},
  },
  colors = {
    tab_bar = {
      background = '#b0b0b0',
      active_tab = {
        bg_color = '#4e90a7',
        fg_color = '#f7f7f7',
      },
      inactive_tab_hsb = {
        saturation = '0.8',
        brightness = '0.7',
      },
    },
  },
}
