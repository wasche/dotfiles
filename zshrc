source ~/.zsh/env.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/chpwd.profiles.zsh

# todo check $OSTYPE == "darwin10.0"
source ~/.zsh/macosx.zsh

if [[ -f ~/.zsh/special/zshrc ]]; then
  source ~/.zsh/special/zshrc
fi

if [[ -f ~/.zsh.local ]]; then
  source ~/.zsh.local
fi

true
