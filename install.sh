#!/bin/bash

PREFIX="/usr/local"

mkdir -p $PREFIX/bin || (mkdir $PREFIX; mkdir $PREFIX/bin)
cp ./selfprofiler.sh $PREFIX/bin
mv $PREFIX/bin/selfprofiler.sh $PREFIX/bin/selfprofiler

echo selfprofiler installed successfully.
