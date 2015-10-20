#!/bin/bash

notifier=terminal-notifier

# create variables
while read L; do
	k="`echo "$L" | cut -d '=' -f 1`"
	v="`echo "$L" | cut -d '=' -f 2`"
	export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|songStationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\|coverArt\|stationCount\|station[0-9]*\)=' /dev/stdin) # don't overwrite $1...

# artistbookmark, songban, songbookmark, songexplain, songfinish, songlove, songmove, songshelf, songstart, stationaddgenre,  stationaddmusic,  station-
# addshared,  stationcreate,  stationdelete,  stationdeleteartistseed,  stationdeletefeedback, stationdeletesongseed, stationfetchinfo, stationfetchplaylist, stationfetchgenre station-
# quickmixtoggle, stationrename, userlogin, usergetstations
case "$1" in
  songstart)
    $notifier \
      -message "$title" \
      -title "$stationName" \
      -subtitle "$artist" \
      -appIcon $coverArt \
      -sender com.google.Chrome.app.Default-fbangkleohkafngihneedemihgfeikcl
    ;;
  *)
    # ignore for now
    ;;
esac
