#!/bin/bash
# Set dark theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# Other settings customization can go here
# ...

# Apply changes
dconf update
