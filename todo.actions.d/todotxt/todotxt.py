#!/usr/bin/env python
"""
"""

from task import Task
from project import Project

class TodoTxt:
    """Todo.txt File"""

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
