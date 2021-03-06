
#This is a useful script to run multiple nmap commands and save them in a folder, this allows for a more quicker and efficient way to scan networks
#in order to save time. This was created specifically for me to suceed in the OSCP as some machines may have ports open other than the top TCP 1000
#common ones. As a result, this provides me with a full scan of the network whilst allowing me to continue with other imperative tasks.


#!/bin/bash
if [ -e /root/Desktop/nmapscans ] 
then
echo "Nmap scan directory already exists"
else
echo "Created Nmap scan directory in /root/Desktop/nmapscans "
mkdir /root/Desktop/nmapscans
fi
ip=$@
v=( $ip )
for (( i = 0; i <= ${#v[@]} - 1; i++ )) 
do
mkdir /root/Desktop/nmapscans/${v[$i]}
nmap -sC -sV -O -oN /root/Desktop/nmapscans/${v[$i]}/TCP1000port.txt ${v[$i]} -d >/dev/null
echo "First Nmap scan of box 1 scanned most common 1000 ports and default scripts completed for box ${v[$i]}" 
echo "nmap -sC -sV -O -oN /root/Desktop/nmapscans/${v[$i]}/TCP1000port.txt ${v[$i]} -d >/dev/null" > /root/Desktop/nmapscans/${v[$i]}/nmapcommands.txt
nmap -F -sC -sV -vv -oN /root/Desktop/nmapscans/${v[$i]}/UDP100ports.txt ${v[$i]} -d >/dev/null
echo "second nmap scan of top 100 ports completed with default scripts"
echo "nmap -sC -sV -p 1-65535 -oN /root/Desktop/nmapscans/${v[$i]}/TCPallports.txt ${v[$i]} -d >/dev/null" >> /root/Desktop/nmapscans/${v[$i]}/nmapcommands.txt
nmap -sU -oN /root/Desktop/nmapscans/${v[$i]}/UDP.txt ${v[$i]} -d > /dev/null
echo " udp port scan completed for 1000 most common ports"
echo "nmap -sU -oN /root/Desktop/nmapscans/${v[$i]}/UDP-1000.txt ${v[$i]} -d > /dev/null" >> /root/Desktop/nmapscans/${v[$i]}/nmapcommands.txt
done


