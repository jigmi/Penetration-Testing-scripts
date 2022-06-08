#This ping sweep script can determine which hosts on a subnet are alive. This is 
#useful for quickly identifying which hosts to focus on and which are offline.
#!/bin/bash
for numbers in {1..244}
ping -c 1 -W 1 $1.$numbers | grep "from" | cut -d " " -f 4 | cut -d ":" -f 1 &
sleep .03
done
echo "The ping sweep has been completed"
