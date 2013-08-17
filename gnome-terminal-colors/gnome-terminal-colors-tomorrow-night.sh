# Tomorrow Night colors for gnome-terminal 3.x

palette=#000000:#912226:#778900:#ae7b00:#1d2594:#682a9b:#2b6651:#929593:#666666:#cc6666:#b5bd68:#f0c674:#81a2be:#b294bb:#8abeb7:#ecebec
foreground_color=#c5c8c6
background_color=#1d1f21
bold_color=#8abeb7

dconfdir=/org/gnome/terminal/legacy/profiles:
profile_id=$(dconf read $dconfdir/default)
profile_path=$dconfdir/:$profile_id

# color palette
eval dconf write $profile_path/palette "\"['$palette']\""

# foreground, background and highlight color
eval dconf write $profile_path/foreground-color "\"'$foreground_color'\""
eval dconf write $profile_path/background-color "\"'$background_color'\""
eval dconf write $profile_path/bold-color "\"'$bold_color'\""

# profile does not use theme colors
eval dconf write $profile_path/use-theme-colors "false"

# highlighted color different from foreground color
eval dconf write $profile_path/bold-color-same-as-fg "false"
