#!/usr/bin/python
import sys
import re
import httplib
from urlparse import urlparse
import urllib2
import requests

inputfile = open(sys.argv[2])
outputfile = open("validAddress.txt", 'w+')
ip = sys.argv[1]
i = 0
print

for line in inputfile:
    if re.match('^/', line):
        line = line.rstrip()

        req = urllib2.Request(ip + line)
        #print ip + line
        try:
            r = urllib2.urlopen(ip + line, timeout=4)
        except (urllib2.URLError, httplib.BadStatusLine) as e:
            continue

        print ip + line,
        print "	--> Authorized access !!!"
        outputfile.write(ip + line)
        outputfile.write("\n")

inputfile.close()

print "DONE!"
