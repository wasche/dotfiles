#!/usr/bin/env bash
dirname=`which dirname`
basename=`which basename`
enc=`which ffmpeg`

IN=$1
PATH=$2

if [ -z "$PATH" ]; then
  PATH=`$dirname "$IN"`
fi

FILE=`$basename "$IN"`
extension="${FILE##*.}"
FILE="${FILE%.*}"
OUT="$FILE.h265.mp4"

CREATED=`/bin/date -u +'%F %T'`

$enc -i "$IN" -c:v libx265 -preset medium \
  -x265-params crf=23 -c:a copy \
  -map_metadata -1 \
  -metadata "creation_time=$CREATED" \
  -metadata "title=$FILE" \
  -movflags +faststart \
  "$PATH/$OUT"
