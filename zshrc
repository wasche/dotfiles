source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/git-flow-completion/git-flow-completion.zsh

source ~/.zsh/oh-my-zsh/lib/spectrum.zsh

source ~/.zsh/oh-my-zsh/plugins/github/github.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/node/node.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/npm/npm.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/python/python.plugin.zsh

source ~/.zsh/chpwd.profiles.zsh
source ~/.zsh/path.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/env.zsh
source ~/.zsh/prompt.zsh

source ~/.zsh/todo.zsh

source ~/.zsh/templates.zsh

source ~/.zsh/os.zsh

if [[ -d ~/.zsh/include.d ]]; then
  for dir (~/.zsh/include.d/*) {
    if [[ -d $dir && -f $dir/zshrc ]]; then
      source $dir/zshrc
    fi
  }
fi

source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

if [[ -f ~/.zsh.local ]]; then
  source ~/.zsh.local
fi

#source ~/.zsh/screen.zsh

true
