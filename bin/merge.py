#!/usr/bin/python

# A brittle script to print each line in superset file
#   that starts with line in subset file
# Assumes both files are sorted and each line in subset file
#   has a corresponding line in superset file
# If not, undefined behavior

# USAGE merge.py SUBSET_FILE SUPERSET_FILE

import sys

if len(sys.argv) != 3:
    print 'USAGE merge.py SUBSET_FILE SUPERSET_FILE'
    sys.exit(1)
subsetfile   = open(sys.argv[1], 'r')
supersetfile = open(sys.argv[2], 'r')
subline = subset_file.readline().rstrip()
supline = superset_file.readline().rstrip()
while subline and supline:
    while supline and not (supline.split(',')[0]).startswith(subline):
        supline = superset_file.readline().rstrip()
    print supline
    subline = subset_file.readline().rstrip()
