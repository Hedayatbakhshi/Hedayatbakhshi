#!/bin/sh
# Run after the renderer: drops the credit badge and tightens spacing.
set -e
sed -i '/metawka.github.io/d' README.md
rm -f assets/credit-*.svg
# Cache-bust social icons so browsers/GitHub's image proxy pick up changes
sed -i 's|\(assets/social-[A-Za-z0-9._-]*\.svg\)|\1?v=2|g' README.md
sed -i '/^$/d' README.md
