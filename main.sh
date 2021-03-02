#!/bin/bash
# https://github.com/faisalfs10x -135551
# 20-SEPT-2020

echo -e "     \e[93mhello $USER@$HOSTNAME:- ";
echo -e "       \e[92mExternal Recon";
date +"%A, %b %d, %Y %I:%M %p"
echo -e "\e[0m"

PS3='Select pls: '
options=("Shodan ASN scanner" "Google Dork" "N/A" "Quit")

dir_scan=$PWD/scanner
sed_scan=$PWD/scanner/*

select opt in "${options[@]}"
do
    case $opt in
        "Shodan ASN scanner")
            #echo "Shodan scanner"
			echo -n "Type ASN: ";
            read;
            #ls $dir_scan
            for files in $sed_scan;
                do
                    sed -i "s/asn:[^ ]*/asn:${REPLY}/g" $files  
                done
            #sed -i "s/country:[^ ]*/country:${REPLY}/g"
			echo -e "\n\e[93m---------CiscoCVE-2020-3452 checker---------\e[0m\n"
			bash $dir_scan/CiscoCVE-2020-3452.sh 2>/dev/null
			echo -e "\n\e[93m---------DNS Amplification checker---------\e[0m\n"
			bash $dir_scan/dnsAmp.sh 2>/dev/null
            echo -e "\n\e[93m---------Common Query---------\e[0m\n"
            bash $dir_scan/query.sh
	
            ;;
        "Google Dork")
            echo "in progress"
            ;;
        "N/A")
            echo "in progress"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
