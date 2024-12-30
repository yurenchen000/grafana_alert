#!/bin/bash

dir=`dirname $(readlink -f $BASH_SOURCE)`

# -----
echoR(){ echo -e "\e[31m$@\e[0m"; }
echoG(){ echo -e "\e[32m$@\e[0m"; }
echoY(){ echo -e "\e[33m$@\e[0m"; }
echoH(){ echo -e "\e[01;32;40m$@\e[0m"; }

# ----- conf

# Set the save interval (in seconds)
save_interval=$((1 * 3600))  # 1 hour (adjust as needed)
check_interval=300
# save_interval=5 
# check_interval=5

temp_tit='${hostname} ${mount_point} Low Disk Space Warning'
temp_msg='Available space on ${mount_point} is ${avail_gb}GB, which is below the ${threshold_gb}GB threshold.'

# File to save disk space information
disk_log="disk_hist.log"

# Source conf
source $dir/push_notify.sh
source $dir/_disk_notify_global

# push_backend='pushplus wxpusher feishu dingtalk telegram'
# push_backend='wxpusher feishu dingtalk telegram'
push_backend='wxpusher feishu dingtalk '
push_backend='pushplus wxpusher feishu dingtalk'

load_push_impl

##--------- main
# push_notify hello  "hello, world  


