#!/usr/bin/env bash

echo "<!DOCTYPE html><html><head><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.8.1/github-markdown.min.css"></head><body><div class="markdown-body"><h1>Coverage Reports</h1><ul>" > index.html

for d in */ ; do
  # skip hidden or unwanted dirs
  [[ "$d" == .* ]] && continue

  # only include dirs that contain index.html
  if [ -f "$d/index.html" ]; then
    name="${d%/}"
    echo "<li><a href=\"./$name/\">$name</a></li>" >> index.html
  fi
done

echo "</ul></div></body></html>" >> index.html
