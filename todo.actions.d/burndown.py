#!/usr/bin/env python

""" TODO.TXT Burndown Chart Report
USAGE:
    burndown.py [todo.txt] [done.txt]

CHANGELOG:
    2012.00.00
"""

import sys
import todotxt

__version__ = "0.1"
__date__ = "2012/11/06"
__updated__ = "2012/11/06"
__author__ = "Wil Asche (wil@asche.us)"
__copyright__ = "Copyright 2012, Wil Asche"
__license__ = "GPL"
__history__ = """
1.0 - Released.
"""

def usage():
    print "USAGE:  %s [todo.txt] [done.txt]" % (sys.argv[0], )

def load(filename):
    tasks = todotxt.read(filename)
    print tasks

if __name__ == "__main__":
    load(sys.argv[1])
