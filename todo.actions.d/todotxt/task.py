"""A single task in a todo.txt file."""

import re

DateFormat = re.compile('\d{4}-\d{2}-\d{2}')
PriorityFormat = re.compile('\(([A-Z])\) ')
ContextFormat = re.compile('@([^\s]+[\w_])')
ProjectFormat = re.compile('\+([^\s]+[\w_])')
MetaFormat = re.compile('([^\s:][\w_]+):([^\s]+[\w_])')

class Task:
    """todo.txt Task"""

    description = ''
    priority = None
    createdOn = None
    completedOn = None
    completed = False
    contexts = None
    projects = None
    metadata = None
    archived = False

    def __init__(self, index, archived=False):
        self.index = index
        self.archived = archived

    def addContext(self, context):
        if self.contexts is None:
            self.contexts = set()
        self.contexts.add(context)

    def addProject(self, project):
        if self.projects is None:
            self.projects = set()
        self.projects.add(project)

    def addMetaData(self, key, value):
        if self.metadata is None:
            self.metadata = {}
        self.metadata[key] = value

    def parse(self, s):
        self.source = s

        # Rule 1: A completed task starts with an x.
        if s[:1] == "x":
            self.completed = True
            s = s[3:]

            # Rule 2: The date of completion appears directly after the x, separated by a space
            m = DateFormat.search(s[:10])
            if m != None:
                self.completedOn = m.group()
                s = s[12:]

        # Rule 3: If a priority exists, it always appears first
        m = PriorityFormat.search(s[:4])
        if m != None:
            self.priority = m.group(1)
            s = s[3:]

        # Rule 4: creation date may optionally appear directly after priority and a space
        m = DateFormat.search(s[:10])
        if m != None:
            self.createdOn = m.group()
            s = s[12:]

        # Rule 5: contexts and projects may appear anywhere in the line after priority/prepended date.
        for m in ContextFormat.finditer(s):
            n = m.group(1)
            self.addContext(n)
        
        for m in ProjectFormat.finditer(s):
            n = m.group(1)
            self.addProject(n)
        
        for m in MetaFormat.finditer(s):
            self.addMetaData(m.group(1), m.group(2))
            s = s[:m.start()] + s[m.end()+1:]

        # if projects or contexts appear at the end of the string, remove them
        w = s.split(' ')
        while (w[-1][:1] == '+' and w[-1][1:] in self.projects) or (w[-1][:1] == '@' and w[-1][1:] in self.contexts):
            del w[-1]

        self.description = ' '.join(w)

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
