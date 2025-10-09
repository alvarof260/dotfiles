from libqtile import bar
from libqtile.config import Screen
from settings.widgets import primary_widgets
from settings.themes import colors


def status_bar(widgets):
    return bar.Bar(
        widgets, 32, margin=[5, 150, 0, 150], background=colors["background"]
    )


screens = [
    Screen(top=status_bar(primary_widgets)),
]
