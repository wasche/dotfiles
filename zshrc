source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/chpwd.profiles.zsh
source ~/.zsh/path.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/env.zsh
source ~/.zsh/prompt.zsh

source ~/.zsh/os.zsh

if [[ -f ~/.zsh/special/zshrc ]]; then
  source ~/.zsh/special/zshrc
fi

if [[ -f ~/.zsh.local ]]; then
  source ~/.zsh.local
fi

true
