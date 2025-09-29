# CÓDIGO CORREGIDO:
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
from settings.themes import colors


def base(bg="dark", fg="text"):
    return {"background": colors[bg], "foreground": colors[fg]}


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg="text", bg="dark", fontsize=16, text="?"):
    return widget.TextBox(**base(bg, fg), fontsize=fontsize, text=text, padding=5)


def workspaces():
    return [
        separator(),
        widget.GroupBox(
            font="IosevkaTerm Nerd Font Bold",
            fontsize=14,
            active=colors["active"],
            inactive=colors["inactive"],
            highlight_method="text",
            urgent_alert_method="text",
            disable_drag=True,
            this_current_screen_border=colors["focus"],
            center_aligned=True,
            decorations=[
                RectDecoration(
                    colour=colors["color3"],
                    radius=5,  # radio para esquinas redondeadas
                    filled=True,
                    padding_x=2,
                    padding_y=2,
                )
            ],
        ),
        separator(),
        widget.WindowName(
            **base(fg="focus"),
            fontsize=12,
            padding=10,
            max_chars=100,
        ),
        separator(),
    ]


primary_widgets = [
    icon(fg="color3", text=" 󰣇 ", fontsize=34),
    *workspaces(),
    separator(),
    # widget.Redshift(),
    widget.TextBox(
        text=" 󰍛 ",
        foreground=colors["grey"],
        fontsize=34,
        padding=-10,
        decorations=[
            RectDecoration(
                colour=colors["color1"],
                filled=True,
                radius=[5, 0, 0, 5],
                padding_y=2,
            ),
        ],
    ),
    widget.CPU(
        foreground=colors["text"],
        format="{load_percent}%",
        padding=8,
        decorations=[
            RectDecoration(
                colour=colors["inactive"],
                filled=True,
                radius=[0, 5, 5, 0],
                padding_y=2,
            ),
        ],
    ),
    separator(),
    widget.TextBox(
        text="  ",
        foreground=colors["grey"],
        fontsize=34,
        padding=-10,
        decorations=[
            RectDecoration(
                colour=colors["color2"],
                filled=True,
                radius=[5, 0, 0, 5],
                padding_y=2,
            ),
        ],
    ),
    widget.Memory(
        foreground=colors["text"],
        measure_mem="G",
        format="{MemUsed: .0f}{mm}",
        padding=8,
        decorations=[
            RectDecoration(
                colour=colors["inactive"],
                filled=True,
                radius=[0, 5, 5, 0],
                padding_y=2,
            ),
        ],
    ),
    separator(),
    widget.TextBox(
        text="  ",
        foreground=colors["grey"],
        fontsize=34,
        padding=-10,
        decorations=[
            RectDecoration(
                colour=colors["urgent"],
                filled=True,
                radius=[5, 0, 0, 5],
                padding_y=2,
            ),
        ],
    ),
    widget.Clock(
        format="%H:%M",
        padding=8,
        decorations=[
            RectDecoration(
                colour=colors["inactive"],
                filled=True,
                radius=[0, 5, 5, 0],
                padding_y=2,
            ),
        ],
    ),
    separator(),
]

widget_defaults = {
    "font": "IosevkaTerm Nerd Font Mono",
    "fontsize": 14,
    "padding": 1,
}
extension_defaults = widget_defaults.copy()
