#!/bin/bash

KERNEL=`uname -s`
OS=`uname -v | cut -d' ' -f1`

if [[ "Darwin" == "$KERNEL" ]]; then
  echo "macosx"
elif [[ "Linux" == "$KERNEL" ]]; then
  if [[ "#29-Ubuntu" == "$OS" ]]; then
    echo "ubuntu"
  else
    echo "linux"
  fi
fi
