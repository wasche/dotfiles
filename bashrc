source ~/.bash/env.bash
source ~/.bash/aliases.bash
source ~/.bash/macosx.bash

if [[ -f ~/.bash/special/bashrc ]]; then
  source ~/.bash/special/bashrc
fi

if [[ -f ~/.bash_local ]]; then
  source ~/.bash_local
fi
