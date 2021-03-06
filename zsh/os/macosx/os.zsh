# do MacPorts setup on darwin
export PATH=$PATH:/opt/X11/bin

if [[ -d /opt/local ]]; then
  export PATH=/opt/local/bin:/opt/local/sbin:$PATH
  export MANPATH=/opt/local/share/man:$MANPATH
fi

source ~/.zsh/os/macosx/zkbd.zsh

# fix home/end
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

if which mvim >/dev/null 2>&1; then
  export EDITOR="mvim -f"
fi

export JAVA_HOME=`/usr/libexec/java_home`

export ANT_HOME=/usr/local/Cellar/ant/1.9.2/libexec
if [[ "$PATH" != *$ANT_HOME/bin* ]]; then
  export PATH=$PATH:$ANT_HOME/bin
fi

if [[ -d /usr/local/android ]]; then
  export PATH=$PATH:/usr/local/android
fi

export GOPATH=/usr/local/go-packages
if [[ -d ~/src/go-lang/bin ]]; then
  export PATH=$PATH:~/src/go-lang/bin
fi

alias attach='open -a Mail.app'

mdb()
{
  if [[ "start" == "$1" ]]; then
    mongod run --config /usr/local/Cellar/mongodb/2.0.1-x86_64/mongod.conf --logpath /var/log/mongodb.log --logappend &
  else
    mongo $@
  fi
}

export NODE_PATH=/usr/local/share/npm/lib/node_modules


# Cancel those terrible ideas Homebrew had of forcing update every 300 s and
# forcing a 3 s curl on every single run.
HOMEBREW_NO_AUTO_UPDATE=1
HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE HOMEBREW_NO_ANALYTICS
