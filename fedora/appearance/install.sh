#!/bin/sh

echo "---"
echo "Appearance Tweaks"
echo " "
echo "This script will install the following components:"
echo " "
echo "* Gnome Tweaks"
echo "* Arc GTK Themes"
echo "* Papirus GTK Icon Themes"
echi "* Gnome Shell Extension - Dash to Dock"
echo " "

sudo dnf copr enable dirkdavidis/papirus-icon-theme
sudo dnf install -y gnome-tweak-tool arc-theme papirus-icon-theme gnome-shell-extension-dash-to-dock

echo " "
echo "Now, open Gnome Tweak and select the desired themes."
