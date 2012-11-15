#!/usr/bin/env python

""" TODO.TXT Burndown Chart Report
USAGE:
    burndown.py [todo.txt] [done.txt]

CHANGELOG:
    2012.00.00
"""

import sys
from todotxt import TodoTxt, Task, Project

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

def load(argv):
    todos = TodoTxt(argv[0], argv[1])
    for p in todos.projects():
    	print p
        total = len(p.tasks)
        completed = filter(lambda t: t.completed, p.tasks)
        remaining = filter(lambda t: not t.completed, p.tasks)
        print "  Progress: {0}/{1} ({2:.0f}%)".format(len(completed), total, (len(completed) / float(total)) * 100)
        print "  Remaining Tasks:"
    	for t in remaining:
    		print "    {0:02d} {1}".format(t.index, repr(t))

if __name__ == "__main__":
	if len(sys.argv) != 3:
		usage()
	else:
		load(sys.argv[1:])
