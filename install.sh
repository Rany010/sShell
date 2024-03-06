#!/bin/bash

# **********************************************************
# * Author        : Rany010
# * Email         : rany010.y@gmail.com
# * Create time   : 2024-03-06
# * Filename      : install.sh
# * Description   : 自动安装部署
# **********************************************************

echo "Installing sShell"

usage="bash install.sh"
sShell_service="./conf/sShell.service"

function install() {
    sudo apt update -y   
}

function update_service() {
    if [ ! -f $sShell_service ]; then
        echo "sShell_service file not found"
        exit 1
    fi

    sudo cp $sShell_service /lib/systemd/system
}

function install() {
    install

    update_service

    echo "start servie"
    sudo systemctl daemon-reload
    sudo systemctl enable sShell.service
    sudo systemctl restart sShell.service

    echo "curr service status"
    sudo systemctl status sShell.service
}

install