#!/usr/bin/python

# Zips arbitrary amount of files together line by line, printing to stdout

import sys.argv

files = []
try:
    for filename in argv[1:]:
        files.append(file(filename))
except IOError:
    print "Error: File \"%s\" not found" % filename

for line_tuple in zip(files):
    for l in line_tuple:
        print l,
