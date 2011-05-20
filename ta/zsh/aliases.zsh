
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

alias ja='ant -f $TRTOP/build.xml jar-applications'
alias jj='make -C $TRTOP/site/js3 -j5'
alias jc='make -C $TRTOP/site/css2 -j5'
alias jt='ant -f $TRTOP/build.xml jar-tr'
alias ju='ant -f $TRTOP/build.xml jar-unittests'
alias jlt='ant -f $TRTOP/build.xml jar-livetools'

alias sx='sudo $TRTOP/scripts/httpd_stop.sh'

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

function onoz()
{
  if [[ "$1" == "lb" ]] || [[ "$1" == "lookback" ]]; then
    shift
    # $HOME/bin/lookback_tail
  elif [[ "$1" == "trip" ]]; then
    highlight_tail /etc/httpd-MAINLINE/logs/tripadvisor.log
  elif [[ "$1" == "access" ]]; then
    highlight_tail /etc/httpd-MAINLINE/logs/access_log
  else
    echo "Try again? (lb|trip|access)" 1>&2
    return 2
  fi
}
