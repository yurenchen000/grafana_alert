#!/bin/bash

#{
#echo
#echo "====== `date -Is`: $@"
#echo ---args
#for i in "$@"; do
#	echo "- $i"
#done
#echo ---file
#echo "file: $fname"
#echo "text: `cat $fname`"
#echo ---env
#echo "title: $title"
#} >> ~/test.out

echo "--- GOT: $@ ---"
title="$1"
msg="$2"
name="$3"
txt="`cat $fname`"
cp -pv "$fname" "payload.`date +'%F_%T'`"
# env | grep '^[a-z]' > "env.`date +'%F_%T'`"

msg="${msg//localhost:/jk4:}"

. ./gf_notify.sh

# call_cmd $mac 'echo dn_ok_`hwinfo get mac`'
push_old=0
push_cnt=0
push_delay=30
push_msg(){
	local tit="$1"
	local msg="$2"

	# curl -s http://pushplus.hxtrip.com/send -d "token=$tok" -d "title=$tit" -d "content=$msg" #-H 'Content-Type: text/markdown'
  push_notify "$tit" "$msg"
}


qqq='```'
body="## $name
----<br>
$msg
----"

# ----<br>
# $qqq
# $txt
# $qqq

tit="$status| $alertname |$job"
bod="
$summary
$instance 
$values

rule: $generatorURL

board: $dashboardURL
"

# echo "=== `date -Is`: $title -- $body" >> grafana_alert.out
echo "=== `date -Is`: $tit -- $bod" >> grafana_alert.out
echo "--msg: $msg"$'\n\n'"txt: $txt"$'\n\n' >> grafana_alert.out

env | grep '^[a-z]' >> grafana_alert.out
## note: app recv format wrong: lost newline, wrong html,wrong markdown
# push_msg "$title" "$body"
push_msg "$tit" "$bod" >> grafana_alert.out


