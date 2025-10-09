from qtile_extras import widget
from libqtile.lazy import lazy
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.popup.templates.mpris2 import DEFAULT_LAYOUT
from settings.themes import colors


# def base(bg="dark", fg="text"):
#     return {"background": colors[bg], "foreground": colors[fg]}
#
#
def separator():
    return widget.Sep(background=None, linewidth=0, padding=5)


#
#
# def icon(fg="text", bg="dark", fontsize=16, text="?"):
#     return widget.TextBox(**base(bg, fg), fontsize=fontsize, text=text, padding=5)


def icon(text):
    return widget.TextBox(
        fontsize=20,
        text=text,
        decorations=[
            RectDecoration(
                filled=True,
                colour=colors["overlay"],
                radius=5,
                padding_x=5,
                padding_y=4,
            )
        ],
    )


def workspaces():
    return [
        separator(),
        widget.GroupBox(
            font="IosevkaTerm Nerd Font Propo Bold",
            fontsize=18,
            active=colors["active"],
            inactive=colors["inactive"],
            highlight_method="text",
            urgent_alert_method="text",
            disable_drag=True,
            this_current_screen_border=colors["text"],
            center_aligned=True,
            decorations=[
                RectDecoration(
                    colour=colors["overlay"],
                    radius=5,  # radio para esquinas redondeadas
                    filled=True,
                    padding_x=2,
                    padding_y=3,
                )
            ],
        ),
        separator(),
    ]


primary_widgets = [
    separator(),
    icon(" 󰣇 "),
    separator(),
    widget.CurrentLayout(
        fontsize=14,
        padding=5,
        mode="both",
        icon_first=True,
        scale=0.5,
        foreground=colors["text"],
        decorations=[
            RectDecoration(
                colour=colors["overlay"],
                radius=5,
                filled=True,
                padding_y=3,
            )
        ],
    ),
    separator(),
    widget.WidgetBox(
        fontsize=14,
        close_button_location="right",
        foreground=colors["text"],
        widgets=[
            separator(),
            widget.CPU(
                fontsize=14,
                foreground=colors["text"],
                format=" {load_percent}%",
                padding=8,
                decorations=[
                    RectDecoration(
                        colour=colors["overlay"],
                        radius=10,
                        filled=True,
                        padding_y=3,
                    )
                ],
            ),
            separator(),
            widget.Memory(
                fontsize=14,
                foreground=colors["text"],
                padding=8,
                measure_mem="G",
                format=" {MemUsed: .1f}{mm}",
                decorations=[
                    RectDecoration(
                        colour=colors["overlay"],
                        radius=10,
                        filled=True,
                        padding_y=3,
                    )
                ],
                mouse_callbacks={
                    "Button1": lazy.spawn("ghostty -e btop"),
                },
            ),
            separator(),
            widget.ThermalSensor(
                fontsize=14,
                tag_sensor="Core 0",
                foreground=colors["text"],
                format="󰈸 {temp:.1f}{unit}",
                padding=8,
                decorations=[
                    RectDecoration(
                        colour=colors["overlay"],
                        radius=10,
                        filled=True,
                        padding_y=3,
                    )
                ],
            ),
            separator(),
        ],
        text_closed="  ",
        text_open="  ",
        decorations=[
            RectDecoration(
                filled=True,
                colour=colors["overlay"],
                radius=10,
                padding_y=5,
            ),
        ],
    ),
    widget.Spacer(),
    *workspaces(),
    widget.Spacer(),
    # widget.Mpris2(
    #     fontsize=14,
    #     popup_layout=DEFAULT_LAYOUT,
    #     toggle_played=True,
    # ),
    separator(),
    separator(),
    widget.WiFiIcon(
        interface="wlan0",  # Cambialo si tu interfaz es otra (ver abajo)
        padding_y=10,
    ),
    separator(),
    widget.Redshift(
        disabled_txt="  ",
        enabled_txt="  ",
        fontsize=14,
        temperature=3200,
        brightness=0.75,
    ),
    separator(),
    separator(),
    widget.Volume(
        fontsize=14,
        padding=5,
        mute_foreground=colors["error"],
        unmute_format="  {volume}%",
        mute_format="  ",
        decorations=[
            RectDecoration(
                colour=colors["overlay"],
                radius=5,
                filled=True,
                padding_y=4,
            )
        ],
    ),
    separator(),
    widget.Clock(
        fontsize=14,
        format="%H:%M %p",
        padding=5,
        decorations=[
            RectDecoration(
                colour=colors["overlay"],
                filled=True,
                radius=5,
                padding_y=4,
            ),
        ],
    ),
    separator(),
    widget.QuickExit(
        foreground=colors["text"],
        fontsize=18,
        default_text="  ",
        countdown_start=5,
        countdown_format="{ }",
        decorations=[
            RectDecoration(
                filled=True,
                colour=colors["overlay"],
                radius=5,
                padding_x=5,
                padding_y=4,
            )
        ],
    ),
    separator(),
]

widget_defaults = {
    "font": "IosevkaTerm Nerd Font Propo",
    "fontsize": 16,
    "padding": 1,
}
extension_defaults = widget_defaults.copy()
