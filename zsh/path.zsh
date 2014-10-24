# standard path elements
export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin

export PATH=~/bin:$PATH

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

if [[ -d /usr/local/share/npm/bin ]]; then
  export PATH=$PATH:/usr/local/share/npm/bin
fi

if [[ -d /usr/local/rvm ]]; then
  export PATH=$PATH:/usr/local/rvm/bin
fi

if [[ -d /usr/local/lib/jsctags ]]; then
  export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
fi
