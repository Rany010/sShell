#!/bin/bash

# **********************************************************
# * Author        : Rany010
# * Email         : rany010.y@gmail.com
# * Create time   : 2024-03-06
# * Filename      : json_utils.sh
# * Description   : 读写json
# **********************************************************

function jsonGet() {
  path=$1
  key=$2
  ret=`python3 -c "
import json, sys
try:
    X = json.loads(open(sys.argv[1]).read())
    print(X[sys.argv[2]])
except Exception as e:
    pass
  " $path $key`
  echo $ret
}

function jsonSet() {
  path=$1
  key=$2
  value=$3
  ret=`python3 -c "
import json, sys
try:
    X = json.loads(open(sys.argv[1]).read())
except Exception as e:
    X = {}  # create X
try:
    X[sys.argv[2]] = sys.argv[3]
    open(sys.argv[1], 'w').write(json.dumps(X, indent=4, separators=(',', ': ')) + '\n')
except Exception as e:
    print(e)
  " $path $key $value`
}