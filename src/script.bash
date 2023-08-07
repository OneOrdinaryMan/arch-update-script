#!/usr/bin/bash

# Arch Update Script
# Copyright (C) 2023  Srivathsan Sudarsanan
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

read -p "Do you want to update the system? (y/N)" start_script

if [[ $start_script == "y" ]] || [[ $start_script == "Y" ]]; then

    read -p "Do you want to upgrade the mirrors? (y/N)" mirror

    if [[ $mirror == "y" ]] || [[ $mirror == "Y" ]];then
        sudo pacman-mirrors -f 5
    fi
    echo "Updating the MAIN & AUR packages:"
    paru -Syu  --devel --noconfirm
    echo "Updating with RUSTUP"
    rustup update

    read -p "Upgrade complete! Do you want to REBOOT the system now? (y/N)" reboot_confirm
    if [[ $reboot_confirm == "y" ]] || [[ $reboot_confirm == "Y" ]]; then
        reboot
    else
        exit 0
    fi
else
    echo "you pressed n"
    exit 0
fi
