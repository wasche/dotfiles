#!/bin/sh
awk '{p=substr($2,1,1) == "(" ? substr($2,2,1) : "a"; print p, $0}' | sort -k 1 -k 2n | cut -d' ' -f 2-
