# Jellybeans colors for gnome-terminal 3.8.x

palette="['#3b3b3b','#cf6a4c','#99ad6a','#d8ad4c','#597bc5','#a037b0','#71b9f8','#adadad','#636363','#f79274','#c1d592','#ffd574','#81a3ed','#c85fd8','#99e1ff','#d5d5d5']"
foreground_color="'#adadad'"
background_color="'#151515'"
bold_color="'#adadad'"

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
