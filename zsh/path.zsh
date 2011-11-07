if [[ -d ~/.gem/ruby/ ]] && ls ~/.gem/ruby/ >/dev/null 2>&1; then
  for dir in ~/.gem/ruby/*; do
    if [[ -d $dir/bin ]]; then
      export PATH="$dir/bin:$PATH"
    fi
  done
fi

if [[ -d /usr/local/node/bin ]]; then
  export PATH=$PATH:/usr/local/node/bin
fi

if [[ -d /usr/local/rvm ]]; then
  PATH="$PATH:/usr/local/rvm/bin"
fi
