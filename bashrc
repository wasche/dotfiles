for config_file in ~/.bash/*.bash; do source $config_file; done

# load overrides last
source ~/.bash/os.bash

if [[ -f ~/.bash/special/bashrc ]]; then
  source ~/.bash/special/bashrc
fi

if [[ -f ~/.bash_local ]]; then
  source ~/.bash_local
fi

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
