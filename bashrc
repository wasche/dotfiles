for config_file in ~/.bash/*.bash; do source $config_file; done

if [[ -f ~/.bash/special/bashrc ]]; then
  source ~/.bash/special/bashrc
fi

if [[ -f ~/.bash_local ]]; then
  source ~/.bash_local
fi
