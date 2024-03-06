#!/bin/bash

# **********************************************************
# * Author        : Rany010
# * Email         : rany010.y@gmail.com
# * Create time   : 2024-03-06
# * Filename      : conf_utils.sh
# * Description   : 加载配置参数
# **********************************************************

file_name=""
section=""

conf_path=$(cd `dirname $0`; pwd)/../conf
conf_out_path=$(cd `dirname $0`; pwd)/conf

function LoadConfFileName() {
  file_name=$1.ini
}

function LoadConfSection() {
  section=$1
}

function LoadConf() {
  param_count=$#
  local file_key=""
  local section_key=""
  local conf_key=""
  if [ $param_count -eq 3 ]; then
    file_key=$conf_path/$1.ini
    section_key=$2
    conf_key=$3
  elif [ $param_count -eq 2 ]; then
    file_key=$conf_path/$file_name
    section_key=$1
    conf_key=$2
  elif [ $param_count -eq 1 ]; then
    file_key=$conf_path/$file_name
    section_key=$section
    conf_key=$1
  fi
  result=`awk -F '=' '/\['$section_key'\]/{a=1}a==1&&$1~/'$conf_key'/{print $2;exit}' $file_key`
  echo $result
}

function readLine() {
  file_path=$1
  read_key=$2
  split_str=$3
  result=`cat $file_path | grep ${read_key} | awk -F "${split_str}" '{print \$2}'`
  echo $result
}

function LoadGlobalConf() {
  file_name=$1
  read_key=$2
  split_str=$3
  file_path=$global_conf/$file_name
  ret=`cat $file_path | grep ${read_key} | wc -l`     
  result=""
  if [ $ret -gt 0 ]; then
    result=`cat $file_path | grep ${read_key} | awk -F "${split_str}" '{print \$2}'`
  fi
  echo $result
}
