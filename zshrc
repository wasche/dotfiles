source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# load completions
fpath=(/usr/local/share/zsh/site-functions $fpath)

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

true

export PATH="$HOME/.yarn/bin:$PATH"
