export JAVA_HOME=/usr/jdk1.6
export JDK_HOME=/usr/jdk1.6
if [[ "$PATH" != *$JAVA_HOME/bin* ]]; then
  export PATH=$PATH:$JAVA_HOME/bin
fi

export PATH=/usr/local/bin:$PATH

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"


if whichi apt-cache >/dev/null 2>&1; then
  alias aptc='apt-cache'
  alias aptcs='apt-cache search'
fi
