#!/bin/bash

dir=`dirname $(readlink -f $BASH_SOURCE)`
cd $dir

nohup ./webhook -debug -verbose -port 7001 -hooks webhook.json -template &> webhook.out &


