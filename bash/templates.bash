
function tmpl()
{
  if [[ "$1" == "py" ]]; then
    if [[ $# -gt 0 ]]; then
      cp ~/dotfiles/templates/template.py $2
      chmod +x $2
    else
      cp ~/dotfiles/templates/template.py .
      chmod +x template.py
    fi
  elif [[ "$1" == "node" ]]; then
    if [[ $# -gt 0 ]]; then
      cp ~/dotfiles/templates/template.node.js $2
      chmod +x $2
    else
      cp ~/dotfiles/templates/template.node.js template.js
      chmod +x template.js
    fi
  else
    echo "Usage: tmpl (py|node) [target]" 1>&2
    return 2
  fi
}
