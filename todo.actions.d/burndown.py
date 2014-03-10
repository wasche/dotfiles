#!/usr/bin/env python

"""todo.txt Burndown Chart Report
Outputs a report of all projects, their progress, and remaining tasks.

Example:

Project A
  Progress: 5/7 (71%)
  Remaining Tasks:
    03 do something cool
    06 do something cooler
"""

import sys
from operator import attrgetter
from todotxt import TodoTxt, Task, Project

__author__ = "Wil Asche"
__copyright__ = "Copyright 2012, Wil Asche"
__license__ = "MIT"
__version__ = "0.1.0"
__date__ = "2012/11/14"
__updated__ = "2012/11/14"
__email__ = "wil@asche.us"
__history__ = """
0.1 - Released.
"""

def usage():
    print "USAGE:  {0} [todo.txt] [done.txt]".format(sys.argv[0])

def load(argv):
    todoFile = argv.pop(0)
    doneFile = argv.pop(0)

    skip = set()
    while len(argv) > 0:
        arg = argv.pop(0)
        if arg[:1] == '-':
            skip.add(arg[1:])

    todos = TodoTxt(todoFile, doneFile)
    for p in todos.projects():
        if len(p.getContexts() & skip) > 0:
            continue
        remaining = filter(lambda t: not t.completed, p.tasks)
        if len(remaining) == 0:
            continue;

    	print p, '(', ''.join(p.getContexts()), ')'
        total = len(p.tasks)
        completed = filter(lambda t: t.completed, p.tasks)
        remaining = sorted(remaining, key=lambda t: (t.priority or 'ZZ', t.index))
        print "  Progress: {0}/{1} ({2:.0f}%)".format(len(completed), total, (len(completed) / float(total)) * 100)
        print "  Remaining Tasks:"
    	for t in remaining:
    		print "    {0:02d} {1}".format(t.index, repr(t))

if __name__ == "__main__":
	if len(sys.argv) < 3:
		usage()
	else:
		load(sys.argv[1:])
