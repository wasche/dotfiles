
alias logs='cd /etc/httpd-MAINLINE/logs'

function gg() { cd $TRTOP/$@ }
function ga() { gg Applications/$@ }
function gc() { gg site/css2/$@ }
function gi() { gg site/img2/$@ }
function gj() { gg site/js3/$@ }
function gv() { gg site/velocity_redesign/$@ }
function gt() { gg tr/com/TripResearch/$@ }

alias vc='vim $TRTOP/config/hosts/$(hostname -s).ini'
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
    make -C $TRTOP tree_setup && make -C $TRTOP site/config
  elif [[ "$1" == "sql" ]]; then
    ant -f $TRTOP/build.xml sql-generate-tr sql-generate-internal sql-generate-applications sql-generate-features sql-generate-tatools sql-generate-livetools sql-generate-toolsshared
  elif [[ "$1" == "tools" ]]; then
    make -C $TRTOP/Servlets
  elif [[ "$1" == "all" ]]; then
    ant -f $TRTOP/build.xml java
  elif [[ "$1" == "merge" ]]; then
    ant -f $TRTOP/build.xml prepare merge-classes
  elif [[ "$1" == "jr" ]]; then
    ant -f $TRTOP/build.xml tr-jrebel
  elif [[ "$1" == "ngu" ]]; then
    ant -f $TRTOP/build.xml jar-testngUnitTests
  else
    echo "Try again? (all|app|cfg|f|lt|tools|tr|jr|unit|merge|ngu)" 1>&2
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
  if [[ "$1" == "xml" ]]; then
    ant run-unittests-xml | tee unit-tests.log
  elif [[ $# -gt 0 ]]; then
    ENSURE_PURE_UNIT_TESTS=true javatr.sh org.junit.runner.JUnitCore "$@"
  else
    ant run-unittests | tee unit-tests.log
  fi
}

fu()
{
  if [[ $# -gt 0 ]]; then
    ant -f $TRTOP/build.xml -Dfunctest=$1 run-functests
  else
    make -C $TRTOP functional_test
  fi
}

ngu()
{
  export ANT_OPTS=-Xmx500m
  if [[ "$1" == "jailed" ]]; then
    ant testNGTestMethodJailed -DtestNGUnitParallelMode=true 2>&1 | \
      tee jailed.out | \
      grep -A2 'Single Method' | \
      awk 'BEGIN { RS = "--\n" ; FS = "\n" }{ split($2, b, " "); sub(",", "", b[7]); if (b[7] == "0") s = "PASSED"; else s = "FAILED" ; print s, substr($1, 40) }' | \
      tee jailed-results.out
  elif [[ $# -gt 0 ]]; then
    ant run-testngUnitTests-nodeps -DtestConfigFile=$1
  else
    ant run-testngUnitTests-nodeps
  fi
}

apitest()
{
  if [[ $# -gt 0 ]]; then
    $TRTOP/scripts/api/python/run_all.sh $*
  else
    $TRTOP/scripts/api/python/run_all.sh
  fi
}

function sonar()
{
  ant -f $TRTOP/tests/codecoverage/sonar/build.xml local modules
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
  if [[ $# -gt 0 ]]; then
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
  else
    echo "Usage: mcr server [memcache commands]"
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
    bash $WHTOP/clusters/$@/config/env.bash $WHTOP/clusters/$@
  else
    echo "Usage: hc (adhoc|prod)"
  fi
}

alias tm='psql -h rivendell -U tripmaster_ro tripmaster'
alias tm-dev='psql -h devdb03n -U tripmaster'
alias tm-dev-w='psql -h devdb93n -U tripmaster_writable'
alias tm-dev-member='psql -h devdb03n -U tripmaster_member'
alias tm-media='psql -h rivendell -U tripmaster_media'
alias tm-media-dev='psql -h devdb03n -U tripmaster_media'
alias tm-tools='psql -h tools-db -U tripmaster'
alias tm-tools-dev='psql -h tools-db -U tripmaster_tools'
alias tm-test='psql -h test-db -U tripmaster tripmaster_test'
alias tm-test-dev='psql -h test-db -U tripmaster tripmaster_test_wasche-dev'
alias tm-perf='psql -h perfdb -U tripmaster_perf'
alias tm-all='psql -h tripmonster -U tripmonster'

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

function svn-branch-diff()
{
  branch=`svntr branch`
  svntr diff -B && cp diffs.txt /tmp/$branch.diff
}

function svn-branch-update()
{
  svn-branch-diff
  svntr branch-update --script |& tee merge.log
}

function svn-checkout()
{
  branch=$1:u
  dir=$1:l
  svntr checkout //$branch $dir
}

function update()
{
  if [[ "$1" == "data" ]]; then
    pushd ~/src/tr-data 2>&1 >/dev/null
    svntr up
    popd 2>&1 >/dev/null
  elif [[ "$1" == "images" ]]; then
    pushd ~/src/images 2>&1 >/dev/null
    svntr up
    popd 2>&1 >/dev/null
  else
    echo "Try again? (data|images)" 1>&2
    return 2
  fi
}

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

# Greps config/features.ini for matching features
# Feature lines become tab separated, remeber grep doesn't have \t by default
# Use Ctrl+v<Tab> to create a literal tab character
#
# Examples:
# featuregrep -e 'include_daodao[^\t]true.*exclude' -e 'exclude.*include_daodao[^\t]true'
function featuregrep()
{
  cat $TRTOP/config/features.ini |
  sed 's/;.*//g' |          # Remove comments
  tr '\n' '\t' |            # Turn newlines into tabs
  sed 's/[^[]*\[/[/' |      # Remove content before the first [feature]
  sed 's/\s*\t\[/\n\[/g' |  # Add newline before each [feature]
  grep "$@" |               # Search each feature
  awk '{ print $1 }'        # Get the feature name
}
