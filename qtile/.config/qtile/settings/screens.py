from libqtile import bar
from libqtile.config import Screen
from settings.widgets import primary_widgets


def status_bar(widgets):
    return bar.Bar(widgets, 24, margin=[5, 5, 0, 5], opacity=0.1)


screens = [
    Screen(top=status_bar(primary_widgets)),
]
