for config_file in ~/.bash/*.bash; do source $config_file; done

if [[ ${OSTYPE#darwin} != $OSTYPE ]]; then
  source ~/.bash/os/macosx.bash
elif [[ ${OSTYPE#linux} != $OSTYPE ]]; then
  source ~/.bash/os/linux.bash
fi

if [[ -f ~/.bash/special/bashrc ]]; then
  source ~/.bash/special/bashrc
fi

if [[ -f ~/.bash_local ]]; then
  source ~/.bash_local
fi
