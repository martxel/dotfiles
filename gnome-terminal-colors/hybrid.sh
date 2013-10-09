# Hybrid colors for gnome-terminal 3.x

palette="['#282a2e','#a54242','#8c9440','#de935f','#5f819d','#85678f','#5e8d87','#707880','#373b41','#cc6666','#b5bd68','#f0c674','#81a2be','#b294bb','#8abeb7','#c5c8c6']"
foreground_color="'#c5c8c6'"
background_color="'#1d1f21'"
bold_color="'#8abeb7'"

dconfdir=/org/gnome/terminal/legacy/profiles:
profile_id=$(dconf list /org/gnome/terminal/legacy/profiles:/ | sed -e 's/\///g' -n -e '1p')
profile_path=$dconfdir/$profile_id

# color palette
dconf write $profile_path/palette $palette

# foreground, background and highlight color
dconf write $profile_path/foreground-color $foreground_color
dconf write $profile_path/background-color $background_color
dconf write $profile_path/bold-color $bold_color

# profile does not use theme colors
dconf write $profile_path/use-theme-colors "false"

# highlighted color different from foreground color
dconf write $profile_path/bold-color-same-as-fg "false"
