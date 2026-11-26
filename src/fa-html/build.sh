#!/bin/zsh
# Build a resume HTML file to PDF with headless Chrome, then render PNG previews.
# Usage: ./build.sh path/to/resume.html   -> resume.pdf, page1.png, ... next to it
set -e
html="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
dir="$(dirname "$html")"
here="$(cd "$(dirname "$0")" && pwd)"
chrome="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
profile="$(mktemp -d)"
"$chrome" --headless=new --disable-gpu --no-pdf-header-footer --user-data-dir="$profile" \
  --virtual-time-budget=6000 --print-to-pdf="$dir/resume.pdf" "file://$html" >/dev/null 2>&1
rm -rf "$profile"
rm -f "$dir"/page*.png(N)
swift "$here/tools/pdf2png.swift" "$dir/resume.pdf" "$dir" | wc -l | xargs echo "pages:"
