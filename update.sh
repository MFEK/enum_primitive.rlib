#!/bin/bash

set -x

for f in *; do
  if test "$f" != target -a "$f" != update.sh; then
    rm -r "$f"
  fi
done

for f in target/doc/*; do
  cp -r "$f" .
done

# vim: set ts=2 sts=2 sw=2 et:
