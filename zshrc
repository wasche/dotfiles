for config_file (~/.zsh/*.zsh) source $config_file

if [[ ${OSTYPE#darwin} != $OSTYPE ]]; then
  source ~/.zsh/os/macosx.zsh
elif [[ ${OSTYPE#linux} != $OSTYPE ]]; then
  source ~/.zsh/os/linux.zsh
fi

if [[ -f ~/.zsh/special/zshrc ]]; then
  source ~/.zsh/special/zshrc
fi

if [[ -f ~/.zsh.local ]]; then
  source ~/.zsh.local
fi

true
