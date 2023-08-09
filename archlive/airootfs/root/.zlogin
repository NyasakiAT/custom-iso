# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi

~/.automated_script.sh

chmod +x /root/.config/polybar/launch.sh

GTK_THEME=Adwaita
gtk-application-prefer-dark-theme = true
gsettings set org.gnome.desktop.interface gtk-theme Fantome
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
