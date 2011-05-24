export ANT_HOME=/usr/local/ant
export ANT_OPTS=-Xmx500M;
export JAVA_HOME=/usr/jdk1.6
export JDK_HOME=/usr/jdk1.6
if [[ "$PATH" != *$JAVA_HOME/bin* ]]; then
  export PATH=$PATH:$JAVA_HOME/bin
fi

export PATH=/usr/local/bin:$PATH

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"


alias aptc='apt-cache'
alias aptcs='apt-cache search'
