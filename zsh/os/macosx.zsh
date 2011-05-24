# do MacPorts setup on darwin
if [[ -d /opt/local ]]; then
  PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  MANPATH="/opt/local/share/man:$MANPATH"
fi

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"

alias attach='open -a Mail.app'
