#!/bin/bash

VERSION_PATTERN="(ARG\s+S6_OVERLAY_VERSION)=(\"|')(.+)\2"
echo $VERSION_PATTERN

sed -nr "s/$VERSION_PATTERN/arg=\1,quote=\2,value=\3/p" Dockerfile

sed -r \
    "s/$VERSION_PATTERN/\1=\23.1.2.1\2/" \
    Dockerfile
