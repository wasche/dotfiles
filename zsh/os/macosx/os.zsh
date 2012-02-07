# do MacPorts setup on darwin
if [[ -d /opt/local ]]; then
  PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  MANPATH="/opt/local/share/man:$MANPATH"
fi

cwd=`dirname $0`
source $cwd/zkbd.zsh

if which mvim >/dev/null 2>&1; then
  export EDITOR="mvim -f"
fi

export JAVA_HOME=`/usr/libexec/java_home`

export ANT_HOME=/opt/local/share/java/apache-ant
if [[ "$PATH" != *$ANT_HOME/bin* ]]; then
  export PATH=$PATH:$ANT_HOME/bin
fi

PATH="$PATH:/usr/local/android:/Users/wasche/src/go-lang/bin"

alias attach='open -a Mail.app'

export GOROOT=/Users/wasche/src/go-lang
export GOOS=darwin
export GOARCH=amd64
