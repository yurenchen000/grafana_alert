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

# call_cmd $mac 'echo dn_ok_`hwinfo get mac`'
push_old=0
push_cnt=0
push_delay=30
push_msg(){
	local tit="$1"
	local msg="$2"
	local tok="${3:-PUSH_PLUS_TOKEN}"
	push_now=`date +%s`
	if [ $((push_now-push_old)) -le $push_delay ]; then
		echo -e "\e[31m push_msg too fast ($push_cnt recent), wait $push_delay sec!\e[0m"
		return
	fi

	push_cnt=$((push_cnt+1))		#push_cnt
	if [ $((push_now-push_old)) -ge 3600 ]; then
		push_cnt=0		#1hour clear
	fi

	if [ $push_cnt -ge 5 ]; then	#push_delay
		push_delay=600	#10min
	else
		push_delay=30	#.5min
	fi

	push_old=$push_now
	curl -s http://pushplus.hxtrip.com/send -d "token=$tok" -d "title=$tit" -d "content=$msg" #-H 'Content-Type: text/markdown'
}


qqq='```'
body="## $name
----<br>
$msg
----<br>
$qqq
$txt
$qqq
----"

echo "=== `date -Is`: $title -- $body" >> grafana_alert.out

push_msg "$title" "$body"

