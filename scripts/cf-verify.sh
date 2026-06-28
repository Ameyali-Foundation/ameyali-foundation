#!/usr/bin/env bash
set -euo pipefail

for url in \
  "https://ameyalifoundation.org" \
  "https://www.ameyalifoundation.org" \
  "https://ameyali-foundation.pages.dev"
do
  echo "==> ${url}"
  curl -fsSI "${url}" | sed -n '1,5p'
  echo
done
