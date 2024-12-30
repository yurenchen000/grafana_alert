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

echo "=== `date -Is`: $title -- $body" >> grafana_alert.out

push_msg "$title" "$body"

