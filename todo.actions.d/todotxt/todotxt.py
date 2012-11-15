#!/usr/bin/env python
"""Module for interacting with todo.txt and done.txt

Provides support for reading, modifying, and writing todo.txt and done.txt, as per the rules defined by the Todo.txt
project (http://todotxt.com/) at https://github.com/ginatrapani/todo.txt-cli/wiki/The-Todo.txt-Format

Formatting rules:
Rule 1: A completed task starts with an x.
Rule 2: The date of completion appears directly after the x, separated by a space
Rule 3: If a priority exists, it appears first after completion
Rule 4: Creation date may optionally appear directly after priority and a space
Rule 5: Contexts and projects may appear anywhere in the line after priority/prepended date.
"""

from task import Task
from project import Project

class TodoTxt:
    """todo.txt File"""

    _tasks = []
    _projects = {}

    def __init__(self, todoFile, doneFile):
        self.todoFile = todoFile
        self.doneFile = doneFile
        self.read(todoFile)
        self.read(doneFile, True)

    def projects(self):
        return self._projects.itervalues()

    def read(self, filename, archived=False):
        idx = 1
        with open(filename, 'r') as f:
            for line in f:
                line = line.strip()
                if line == "":
                    continue

                task = Task(idx, archived)
                task.parse(line)
                self._tasks.append(task)
                idx += 1

                if task.projects is not None:
                    for n in task.projects:
                        if not self._projects.has_key(n):
                            project = Project(n)
                            self._projects[n] = project
                        else:
                            project = self._projects[n]
                        project.addTask(task)

if __name__ == "__main__":
    import sys
    todos = TodoTxt(sys.argv[1])
    for t in todos.tasks:
        print str(t)
