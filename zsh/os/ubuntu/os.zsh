export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export JDK_HOME=$JAVA_HOME
if [[ "$PATH" != *$JAVA_HOME/bin* ]]; then
  export PATH=$PATH:$JAVA_HOME/bin
fi

export ANT_HOME=/usr/share/ant
if [[ "$PATH" != *$ANT_HOME/bin* ]]; then
  export PATH=$PATH:$ANT_HOME/bin
fi

export PATH=/usr/local/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

if which apt-cache >/dev/null 2>&1; then
  alias aptc='apt-cache'
  alias aptcs='apt-cache search'
fi

