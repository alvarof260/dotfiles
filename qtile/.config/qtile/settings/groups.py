from libqtile.config import Key, Group
from libqtile.lazy import lazy
from settings.keys import keys, mod

group_icons = ["󰣇", "", "", "", "", ""]
groups = [Group(i) for i in group_icons]

for i, group in enumerate(groups):
    pos = str(i + 1)
    keys.extend(
        [
            Key(
                [mod],
                pos,
                lazy.group[group.name].toscreen(),
                desc=f"Switch to group {group.name}",
            ),
            Key(
                [mod, "shift"],
                pos,
                lazy.window.togroup(group.name, switch_group=True),
                desc=f"Switch to & move focused window to group {group.name}",
            ),
        ]
    )
