#!/usr/bin/env python

""" TODO.TXT Burndown Chart Report
USAGE:
    burndown.py [todo.txt] [done.txt]

CHANGELOG:
    2012.00.00
"""

import sys

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

def parseTodo():
    try:
        f = open(argv[0], "r")
        projects = {}
        contexts = {}
        for line in f:
            words = line.split()
            for ford in words:
                if word[0:1] == "+":
                    if word not in projects:
                        projects[word]
                    else:
                        projects[word] = projects.setdefault(word,0) + 1
                if word[0:1] == "@":
                    if word not in contexts:
                        contexts[word] = 1
                    else:
                        contexts[word] = contexts.sefdefault(word,0) + 1
        f.close()
    except IOError:
        print "ERROR:  The file named %s could not be read." % (argv[0], )
        usage()
        sys.exit(2)
