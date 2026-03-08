#!/bin/bash
# Compile all GRAILS beats into master grails.fountain
BEATS_DIR="$(dirname "$0")/beats"
OUTPUT="$(dirname "$0")/grails.fountain"

echo "Title: GRAILS" > "$OUTPUT"
echo "Author: the operator" >> "$OUTPUT"
echo "Draft date: $(date +%Y-%m-%d)" >> "$OUTPUT"
echo "---" >> "$OUTPUT"
echo "" >> "$OUTPUT"

for f in "$BEATS_DIR"/beat-*.fountain; do
  # Strip the title block (first 5 lines: Title, Author, Draft date, ---, blank)
  tail -n +6 "$f" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
  echo "===" >> "$OUTPUT"
  echo "" >> "$OUTPUT"
done

echo "✓ Compiled: $OUTPUT"
echo "  Beats: $(ls "$BEATS_DIR"/beat-*.fountain | wc -l)"
