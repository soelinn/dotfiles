#!/usr/bin/env bash

# =============================
# Installs profile for Debian #
# =============================

# install GDM monitor layout config so the login displays on the chosen primary display
sudo mkdir -p /var/lib/gdm3/.config && sudo cp .config/monitors.xml /var/lib/gdm3/.config/monitors.xml

# install the entire .config to $HOME
cp ./.config ~/
