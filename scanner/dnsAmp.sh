#!/bin/bash
# https://github.com/faisalfs10x
# 07-JAN-2020

DNS_IP=$(shodan search asn: port:53 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
for ip in $DNS_IP;
do
    TEST=$(dig +short +tries=1 +time=2 test.openresolver.com TXT @$ip | grep open-resolver-detected)
    if [ -z "$TEST" ]; then

        echo "$ip is good"
    else
    	echo -e "\e[93m$ip is vulnerable\e[0m";
    	#echo -e "\e[0m"
    fi
done
