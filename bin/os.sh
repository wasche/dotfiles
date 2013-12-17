#!/bin/bash

KERNEL=`uname -s`
OS=`uname -v | cut -d' ' -f1`

if [[ "Darwin" == "$KERNEL" ]]; then
  echo "macosx"
elif [[ "Linux" == "$KERNEL" ]]; then
  if [[ $OS == *"Ubuntu"* ]]; then
    echo "ubuntu"
  else
    echo "linux"
  fi
fi
