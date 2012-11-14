#!/usr/bin/env python
"""
"""

import re
from task import Task
from project import Project

DateFormat = re.compile('\d{4}-\d{2}-\d{2}')
PriorityFormat = re.compile('\(([A-Z])\) ')
ContextFormat = re.compile('@[^\s]+[\w_]')
ProjectFormat = re.compile('\+[^\s]+[\w_]')
MetaFormat = re.compile('[^\s:][\w_]+:[^\s]+[\w_]')

def read(filename):
    tasks = []

    idx = 1
    with open(filename, 'r') as f:
        for line in f:
            line = line.strip()
            if line == "":
                continue

            task = Task(idx)
            idx += 1

            # Rule 1: A completed task starts with an x.
            if line[:1] == "x":
                task.completed = True
                line = line[3:]

                # Rule 2: The date of completion appears directly after the x,
                # separated by a space
                m = DateFormat.search(line[:10])
                if m != None:
                    task.completedOn = m.group()
                    line = line[12:]

            # Rule 3: If a priority exists, it always appears first
            m = PriorityFormat.search(line[:4])
            if m != None:
                task.priority = m.group(1)
                line = line[3:]

            # Rule 4: A task's creation date may optionally appear directly after
            # priority and a space
            m = DateFormat.search(line[:10])
            if m != None:
                task.createdOn = m.group()
                line = line[12:]

            # Rule 5: contexts and projects may appear anywhere in the line after
            # priority/prepended date.
            for m in ContextFormat.finditer(line):
                task.addContext(m.group())
            for m in ProjectFormat.finditer(line):
                task.addProject(m.group())
            for m in MetaFormat.finditer(line):
                task.addMetaData(m.group())

            task.description = line
            tasks.append(task)

    return tasks

if __name__ == "__main__":
    import sys
    tasks = read(sys.argv[1])
    for t in tasks:
        print str(t)
