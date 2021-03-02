#!/bin/bash
# https://github.com/faisalfs10x
# 20-SEPT-2020

echo -e "\n\e[93m---------Unprotected VNC---------\e[0m\n"
query=$(shodan search --fields ip_str '"authentication disabled" "RFB 003.008" asn: ' 2>/dev/null | sort -u ) ; if [ -z "$query" ]; then echo "not found"; else echo $query; fi

echo -e "\n\e[93m---------Windows RDP---------\e[0m\n"
shodan search --fields ip_str '"\x03\x00\x00\x0b\x06\xd0\x00\x00\x124\x00" asn: ' 2>/dev/null

echo -e "\n\e[93m---------SonicWall SSL-VPN Appliance remote exploit checker---------\e[0m\n" 

echo -e "\n\e[93m---------MongoDB---------\e[0m\n"
query=$(shodan search --fields 'ip_str,port' --separator , '"MongoDB Server Information" port:27017 -authentication asn: ' 2>/dev/null | sort -u |  awk -F',' '{print $1":"$2}'); if [ -z "$query" ]; then echo "not found"; else echo $query; fi
shodan search --fields 'ip_str,port' --separator , '"Set-Cookie: mongo-express=" "200 OK" asn: ' 2>/dev/null | sort -u |  awk -F',' '{print $1":"$2}'

echo -e "\n\e[93m---------Laravel debug mode---------\e[0m\n"
shodan search --fields 'ip_str,port' --separator , 'html:"Whoops! There was an error" asn: ' 2>/dev/null | sort -u |  awk -F',' '{print $1":"$2}'

echo -e "\n\e[93m---------WebDav---------\e[0m\n"
shodan search --fields 'ip_str,port' --separator , '(Win32) DAV/2 asn: ' 2>/dev/null | sort -u |  awk -F',' '{print $1":"$2}'

echo -e "\n\e[93m---------Has Screenshot---------\e[0m\n"
shodan search --fields 'ip_str,port' --separator , 'has_screenshot:true asn: ' 2>/dev/null | sort -u |  awk -F',' '{print $1":"$2}'

echo -e "\n\e[93m---------Protected Site---------\e[0m\n"
shodan search --fields 'ip_str,port' --separator , 'port:80 title:protected asn: ' 2>/dev/null | sort -u |  awk -F',' '{print $1":"$2}'

echo -e "\n\e[93m---------Default password---------\e[0m\n"
shodan search --fields 'ip_str,port' --separator , '"default password" asn: ' 2>/dev/null | sort -u |  awk -F',' '{print $1":"$2}'

echo -e "\n\e[93m---------WiFi password---------\e[0m\n"
shodan search --fields 'ip_str,port' --separator , 'html:"def_wirelesspassword" asn: ' 2>/dev/null | sort -u |  awk -F',' '{print $1":"$2}'
