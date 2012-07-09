. ~/.bash/env.bash
. ~/.bash/aliases.bash
. ~/.bash/node_completion.bash

# load overrides last
. ~/.bash/os.bash

if [[ -f ~/.bash/special/bashrc ]]; then
  . ~/.bash/special/bashrc
fi

if [[ -f ~/.bash_local ]]; then
  . ~/.bash_local
fi

