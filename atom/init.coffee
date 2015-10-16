# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

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
