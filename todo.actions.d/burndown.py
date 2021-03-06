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
import re
from operator import attrgetter
from todotxt import TodoTxt, Task, Project
from subprocess import Popen, PIPE

__author__ = "Wil Asche"
__copyright__ = "Copyright 2012, Wil Asche"
__license__ = "MIT"
__version__ = "0.2.0"
__date__ = "2012/11/14"
__updated__ = "2012/11/14"
__email__ = "wil@asche.us"
__history__ = """
0.2.0
    - skip completed projects
    - add remaining LOE
    - add days spent
0.1.0 - Released.
"""

def usage():
    print "USAGE:  {0} [todo.txt] [done.txt]".format(sys.argv[0])

def load(argv):
    todoFile = argv.pop(0)
    doneFile = argv.pop(0)

    pLOE = re.compile('LOE: (\d*\.?\d+)d')
    pDingo = re.compile('dingo(\d+)')

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

        total = len(p.tasks)
        completed = filter(lambda t: t.completed, p.tasks)
        remaining = sorted(remaining, key=lambda t: (t.priority or 'ZZ', t.index))
        spent = -1
        loe = 0

        for context in p.getContexts():
            m = pDingo.search(context)
            if m:
                cmd = "mysql -N -s -h timesink -u reader -preader timesink -e 'select format(sum(days_worked),2) from entries e join projects p on e.id = p.entry_id where login = \"wasche\" and project_id = {0};'".format(int(m.group(1)))
                n = Popen(cmd, stdout=PIPE, shell=True).stdout.read()
                if n[:4] != 'NULL':
                    spent = float(n)

    	print p, '(', ''.join(p.getContexts()), ')'
        if spent >= 0:
            print "  Progress: {0}/{1} ({2:.0f}%), {3:.2f} days spent".format(len(completed), total, (len(completed) / float(total)) * 100, spent)
        else:
            print "  Progress: {0}/{1} ({2:.0f}%)".format(len(completed), total, (len(completed) / float(total)) * 100)
        print "  Remaining Tasks:"
    	for t in remaining:
    	    print "    {0:02d} {1}".format(t.index, repr(t))
            m = pLOE.search(repr(t))
            if m:
                loe += float(m.group(1))
        if loe > 0:
            print "  Remaining LOE: {0:.2f} days".format(loe)

if __name__ == "__main__":
	if len(sys.argv) < 3:
		usage()
	else:
		load(sys.argv[1:])
