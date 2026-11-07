#!/bin/sh
# Run after the renderer: drops the credit badge and tightens spacing.
set -e
sed -i '/metawka.github.io/d' README.md
rm -f assets/credit-*.svg
sed -i '/^$/d' README.md
