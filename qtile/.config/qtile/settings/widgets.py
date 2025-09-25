from libqtile import widget
from settings.themes import colors


def base(bg="dark", fg="text"):
    return {"background": colors[bg], "foreground": colors[fg]}


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def workspaces():
    return [
        separator(),
        widget.GroupBox(
            font="IosevkaTerm Nerd Font",
            fontsize=18,
            margin_y=3,
            margin_x=10,
            padding_y=4,
            padding_x=6,
            borderwidth=0,
            active=colors["active"],
            inactive=colors["inactive"],
            rounded=False,
            highlight_method="text",
            urgent_alert_method="text",
            urgent_border=colors["urgent"],
            this_current_screen_border=colors["focus"],
            other_current_screen_border=colors["dark"],
            disable_drag=True,
        ),
        separator(),
        widget.WindowName(**base(fg="focus"), fontsize=12, padding=10),
        separator(),
    ]


primary_widgets = [
    *workspaces(),
    separator(),
    widget.Pomodoro(
        background=colors["color1"],
        foreground=colors["text"],
        color_brake=colors["urgent"],
        color_active=colors["text"],
        color_inactive=colors["inactive"],
        length_pomodori=40,
        length_long_break=20,
        length_short_break=5,
        padding=10,
    ),
    separator(),
    # widget.Redshift(),
    widget.CheckUpdates(
        distro="arch",
        background=colors["color4"],
        colour_have_updates=colors["text"],
        colour_no_updates=colors["text"],
        no_update_string="0",
        display_format="{updates}",
        update_interval=180,
        custom_command="checkupdates",
        padding=5,
    ),
    separator(),
    widget.CPU(
        background=colors["color3"],
        foreground=colors["text"],
        format="CPU {load_percent}%",
    ),
    separator(),
    widget.Memory(
        background=colors["color2"],
        foreground=colors["text"],
        measure_mem="G",
    ),
    separator(),
    widget.Clock(**base(bg="color1"), format="%d/%m/%Y - %H:%M "),
]

widget_defaults = {
    "font": "IosevkaTerm Nerd Font Mono",
    "fontsize": 14,
    "padding": 1,
}
extension_defaults = widget_defaults.copy()
