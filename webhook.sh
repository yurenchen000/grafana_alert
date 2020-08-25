#!/bin/bash

cd ~/cloud2
nohup /share/upload/webhook -debug -verbose -port 7001 -hooks webhook.json -template &> webhook.out &

