DIR=${0:a:h}

ln -sf $DIR/spaceship-prompt/spaceship.zsh /usr/local/share/zsh/site-functions/prompt_spaceship_setup

autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_PROMPT_ORDER=(
  user
  dir
  host
  git
  docker
  kubecontext
  exec_time
  line_sep
  battery
  jobs
  exit_code
  char
)
