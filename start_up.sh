#!/bin/bash

# **********************************************************
# * Author        : Rany010
# * Email         : rany010.y@gmail.com
# * Create time   : 2024-03-06
# * Filename      : start_up.sh
# * Description   : 启动点
# **********************************************************

curr_path=$(cd `dirname $0`; pwd)

source $curr_path/basic/conf_utils.sh
source $curr_path/basic/json_utils.sh

function load_conf() {
    param1=$(LoadConf "sShell" "PARAMS" "param1")
    param2=$(LoadConf "sShell" "PARAMS" "param2")

    echo "param1: $param1"
    echo "param2: $param2"
}

function check() {
    checker="./checker/checker.sh"
    if [ -n "$checker" ]; then
        echo "recv ota task, start backup"
        bash $curr_path/checker/checker.sh $f 2>&1 | sudo tee -a "/etc/nvidia/checker.log"
    fi
}

function start_up() {
    echo "==============================================================="
    echo "start time sync, current time: $(date)"

    load_conf

    check
}

start_up