# inject shebang to the front of the given editor
injectShebang = (editor, shebang) ->
  editor.moveToTop()
  editor.insertText '#!/usr/bin/env ' + shebang + '\n'

atom.commands.add 'atom-workspace',

  # add bash shebang to a file
  'dot-atom:bash': ->
    # assumes we are looking at an editor
    editor = atom.workspace.getActiveTextEditor()
    injectShebang(editor, 'bash')

  # create a new script and add shebang
  'dot-atom:bash-new': ->
    atom.workspace.open().then (editor) ->
      # the open promise responds with a newly opened editor object
      injectShebang(editor, 'bash')
