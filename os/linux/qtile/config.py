#!/bin/env python
# coding: utf-8

from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
try:
    from libqtile.manager import Key, Group
except ImportError:
    from libqtile.manager import Key, Group
from libqtile.manager import Click, Drag, Screen

sup = "mod4"
alt = "mod1"
ctrl = "mod3"

keys = [
#    Key([sup], "Return", lazy.spawn("urxvt -ls +sb -bg black -fg white")),
    Key([sup], "Return", lazy.spawn("gnome-termial")),
    Key([sup], "Space", lazy.nextlayout()),
]

mouse = [
    Click("Button1", lazy.window.bring_to_front()),
    Drag([sup], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([sup], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
]


