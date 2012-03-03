
alias logdir='cd /etc/httpd-MAINLINE/logs'

function gg() { cd $TRTOP/$@ }
function ga() { gg Applications/$@ }
function gc() { gg site/css2/$@ }
function gi() { gg site/img2/$@ }
function gj() { gg site/js3/$@ }
function gv() { gg site/velocity_redesign/$@ }
function gt() { gg tr/com/TripResearch/$@ }

alias vc='vim $TRTOP/config/hsots/$(hostname -s).ini'
alias fs='$TRTOP/scripts/find-string --relative'

alias sx='sudo $TRTOP/scripts/httpd_stop.sh'

js()
{
  make -C $TRTOP/site/js3 -j5 "$@"
}

css()
{
  make -C $TRTOP/site/css2 -j5 "$@"
}

j()
{
  if [[ "$1" == "tr" ]]; then
    ant -f $TRTOP/build.xml jar-tr
  elif [[ "$1" == "app" ]]; then
    ant -f $TRTOP/build.xml jar-applications
  elif [[ "$1" == "unit" ]]; then
    ant -f $TRTOP/build.xml jar-unittests
  elif [[ "$1" == "func" ]]; then
    ant -f $TRTOP/build.xml jar-functests
  elif [[ "$1" == "f" ]]; then
    ant -f $TRTOP/build.xml jar-features
  elif [[ "$1" == "lt" ]]; then
    ant -f $TRTOP/build.xml jar-livetools
  elif [[ "$1" == "cfg" ]]; then
    make -C $TRTOP tree_setup
  elif [[ "$1" == "sql" ]]; then
    ant -f $TRTOP/build.xml sql-generate-tr sql-generate-internal sql-generate-applications sql-generate-features sql-generate-tatools sql-generate-livetools sql-generate-toolsshared
  elif [[ "$1" == "tools" ]]; then
    make -C $TRTOP/Servlets
  else
    echo "Try again? (tr|app|unit|f|lt|cfg|tools)" 1>&2
    return 2
  fi
}

ie()
{
  if [[ "$1" == "6" ]]; then
    rdesktop -d tripadvisor -u wasche -g 1280x1024 -a 16 -k en-us -z wintest01.tripadvisor.com 2>&1 > /dev/null &
  elif [[ "$1" == "7" ]]; then
    rdesktop -d tripadvisor -u wasche -g 1280x1024 -a 16 -k en-us -z wintest02.tripadvisor.com 2>&1 > /dev/null &
  elif [[ "$1" == "8" ]]; then
    rdesktop -d tripadvisor -u wasche -g 1280x1024 -a 16 -k en-us -z wintest03.tripadvisor.com 2>&1 > /dev/null &
  elif [[ "$1" == "9" ]]; then
    rdesktop -d tripadvisor -u wasche -g 1280x1024 -a 16 -k en-us -z wintest04.tripadvisor.com 2>&1 > /dev/null &
  else
    echo "Try again? (6|7|8|9)" 1>&2
    return 2
  fi
}

u()
{
  if [[ $# -gt 0 ]]; then
    ENSURE_PURE_UNIT_TESTS=true javatr.sh org.junit.runner.JUnitCore "$@"
  else
    make -C $TRTOP test-html
  fi
}

function mc()
{
  if [[ $# -gt 0 ]]; then
    for i in 11211 11311 11411; do
      echo $@ | nc localhost $i
    done
  else
    for i in 11211 11311 11411; do
      echo flush_all | nc localhost $i
    done
  fi
}

function mcr()
{
  server="$1"
  shift
  if [[ $# -gt 0 ]]; then
    for i in 11211 11311 11411; do
      echo $@ | nc $server $i
    done
  else
    for i in 11211 11311 11411; do
      echo flush_all | nc $server $i
    done
  fi
}

function inspect()
{
  javatr.sh com.tripadvisor.inspect.FileDefinitionInspector $@
}

function hc()
{
  if [[ $# -gt 0 ]]; then
    echo "Configuring hive for $@"
    source $WHTOP/clusters/$@/config/env.bash $WHTOP/clusters/$@
  else
    echo "Configuring hive for adhoc"
    source $WHTOP/clusters/adhoc/config/env.bash $WHTOP/clusters/adhoc
  fi
}

alias tripmonster='psql -U tripmonster -h tripmonster'
alias dev-db='psql -h dev-db -U tripmaster'
alias rivendell='psql -h rivendell -U tripmaster'

alias dev='ssh root@wasche-dev'
alias crawfish='ssh wasche@crawfish'

function tab()
{
  (
    cd $TRTOP
    if [[ $# -gt 0 ]]; then
      echo ./scripts/tabuild "$@"
      sudo ./scripts/tabuild "$@"
    else
      echo ./scripts/tabuild -rf
      sudo ./scripts/tabuild -rf
    fi
  )
}

alias svn-status-conflicts="svntr st | egrep '^\s*C'"
alias svn-status-deletes="svntr st | egrep '^\s*D'"
alias svn-branch-update="svntr branch-update --script |& tee merge.log"
alias svn-branch-diff="svntr diff -B"

function onoz()
{
  if [[ "$1" == "lb" ]] || [[ "$1" == "lookback" ]]; then
    shift
    # $HOME/bin/lookback_tail
  elif [[ "$1" == "trip" ]] || [[ "$1" == "ta" ]]; then
    shift
    htail /etc/httpd-MAINLINE/logs/tripadvisor.log --highlight=red:ERROR --highlight=yellow:WARN $@
  elif [[ "$1" == "access" ]]; then
    shift
    htail /etc/httpd-MAINLINE/logs/access_log --highlight=green:200 --highlight=red:404 --highlight=red:500 $@
  else
    echo "Try again? (lb|trip|access)" 1>&2
    return 2
  fi
}
