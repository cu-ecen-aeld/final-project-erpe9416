#!/bin/bash

# Runs make distclean from the buildroot directory

cd buildroot

make distclean

cd ..

echo "Clean.sh has executed make distclean"
