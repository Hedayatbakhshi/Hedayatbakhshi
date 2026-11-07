#!/bin/sh
# Run after the renderer: drops the credit badge and tightens spacing.
set -e
sed -i '/metawka.github.io/d' README.md
rm -f assets/credit-*.svg
# Cache-bust social icons: append a content hash to each image URL so a changed
# icon always gets a brand-new URL (browsers and GitHub's image cache can't reuse it).
for f in assets/social-*.svg; do
  [ -f "$f" ] || continue
  h=$(sha1sum "$f" | cut -c1-8)
  base=$(basename "$f")
  sed -i "s|assets/$base\([^?]\)|assets/$base?v=$h\1|g" README.md
done
sed -i '/^$/d' README.md
