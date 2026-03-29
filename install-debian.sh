#!/usr/bin/env bash

# =============================
# Installs profile for Debian #
# =============================

# install GDM monitor layout config so the login displays on the chosen primary display
sudo mkdir -p /var/lib/gdm3/.config && sudo cp .config/monitors.xml /var/lib/gdm3/.config/monitors.xml

# install the entire .config to $HOME
cp ./.config ~/


# https://wiki.debian.org/NvidiaGraphicsDrivers#Wayland_configuration
#     In case of the NV proprietary driver, specific kernel module options need to be enabled
#     and even then it may not function properly on certain hardware configurations
#     (in which case Gnome will automatically fallback to X11).
#
# Sets proprietary NVIDIA driver's kernel module options to make Wayland option available in GDM login screen.
echo "options nvidia NVreg_PreserveVideoMemoryAllocations=1
options nvidia-drm modeset=1
options nvidia-drm fbdev=1" > ./nvidia-wayland.conf
sudo chown root:root /nvidia-wayland.conf
sudo mv ./nvidia-wayland.conf /etc/modprobe.d/nvidia-wayland.conf
