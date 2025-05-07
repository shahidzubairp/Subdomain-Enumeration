#!/bin/bash
domain=$1
mkdir -p Domains/$domain
cd Domains
cd $domain
echo " starting assetfinder ......"
assetfinder -subs-only $domain > assetfinder.txt
echo "file saved as assetfinder.txt"
echo "sublister starting ......"
sublist3r -d $domain -o sublisted.txt
echo "file saved as sublisted.txt"
echo "starting sorting ....."
cat assetfinder.txt sublisted.txt | sort -u > sorted.txt
echo "file saved as sorted.txt"
echo "starting httprobe ..... "
cat sorted.txt | httprobe > live_subdomain.txt
echo "live subdomains saved as live_subdomain.txt"


