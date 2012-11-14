"""

"""

class Task:
    """Todo.txt Task"""

    description = ''
    priority = None
    createdOn = None
    completedOn = None
    completed = False
    contexts = None
    projects = None
    metadata = None

    def __init__(self, index):
        self.index = index

    def addContext(self, context):
        if self.contexts is None:
            self.contexts = []
        self.contexts.append(context)

    def addProject(self, project):
        if self.projects is None:
            self.projects = []
        self.projects.append(project)

    def addMetaData(self, metadata):
        if self.metadata is None:
            self.metadata = []
        self.metadata.append(metadata)

    def __repr__(self):
        s = []
        if self.completed:
            s.append('x')
            if self.completedOn is not None:
                s.append(completedOn)
                s.append(' ')
        if self.priority is not None:
            s.append('(')
            s.append(self.priority)
            s.append(') ')
        if self.createdOn is not None:
            s.append(self.createdOn)
            s.append(' ')
        s.append(self.description)
        return ''.join(s)

    def __str__(self):
        s = []
        s.append('{0:02d}'.format(self.index))
        s.append(' ')
        if self.completed:
            s.append('x')
            if self.completedOn is not None:
                s.append(completedOn)
                s.append(' ')
        if self.priority is not None:
            s.append('(')
            s.append(self.priority)
            s.append(') ')
        if self.createdOn is not None:
            s.append(self.createdOn)
            s.append(' ')
        s.append(self.description)
        return ''.join(s)
