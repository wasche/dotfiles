#!/bin/bash

KERNEL=`uname -s`
OS=`uname -v | cut -d' ' -f1`

if [[ "Darwin" == "$KERNEL" ]]; then
  echo "macosx"
elif [[ "Linux" == "$KERNEL" ]]; then
  if [[ "Ubuntu" == "${OS:4}" ]]; then
    echo "ubuntu"
  else
    echo "linux"
  fi
fi
