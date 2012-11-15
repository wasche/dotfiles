"""A single project axis in a todo.txt"""

class Project:
    """todo.txt Project"""

    def __init__(self, name):
        self.name = name
        self.tasks = []

    def addTask(self, task):
        self.tasks.append(task)

    def getContexts(self):
        ctx = set()
        for t in self.tasks:
            if t.contexts is not None:
                ctx |= t.contexts
        return ctx

    def __repr__(self):
        return self.name
