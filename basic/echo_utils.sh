#!/bin/bash

# **********************************************************
# * Author        : Rany010
# * Email         : rany010.y@gmail.com
# * Create time   : 2024-03-06
# * Filename      : echo_utils.sh
# * Description   : 打印
# **********************************************************

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # 恢复默认颜色

# error
function error_print() {
  echo -e "${RED}[ERROR] $1${NC}"
}

# waring
function warning_print() {
  echo -e "${YELLOW}[WARNING] $1${NC}"
}

# notice
function info_print() {
  echo -e "${GREEN}[INFO] $1${NC}"
}