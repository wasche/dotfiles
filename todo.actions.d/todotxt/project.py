"""A single project axis in a todo.txt"""

class Project:
    """todo.txt Project"""

    name = None
    tasks = []

    def __init__(self, name):
        self.name = name

    def addTask(self, task):
        self.tasks.append(task)

    def __repr__(self):
        return self.name