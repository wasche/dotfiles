#!/usr/bin/env bash
dirname=`which dirname`
basename=`which basename`
enc=`which ffmpeg`

IN=$1
PATH=$2

if [ -z "$PATH" ]; then
  PATH=`$dirname "$IN"`
fi

FILE=`$basename $IN`
extension="${FILE##*.}"
FILE="${FILE%.*}"
OUT="$FILE.h265.mp4"

$enc -i $IN -c:v libx265 -preset medium \
  -x265-params crf=18 -c:a copy \
  -metadata "creation_time=$(date -u +'%F %T')" \
  -movflags +faststart \
  "$PATH/$OUT"
