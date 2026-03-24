#!/bin/bash

LOG_DIR="$HOME/Shell-Scripting-for-DevOps/myapp/logs"
ARCHIVE_DIR="$LOG_DIR/archive"
MAX_ARCHIVES=30   # keep only the latest 30 compressed logs

mkdir -p "$ARCHIVE_DIR"

# Move logs older than 7 days to archive and compress them
find "$LOG_DIR" -name "*.log" -mtime +7 -exec sh -c '
  archive_dir="$1"
  shift
  for file; do
    base=$(basename "$file")
    dest="$archive_dir/$base"
    mv "$file" "$dest" && gzip "$dest"
  done
' sh "$ARCHIVE_DIR" {} +

# Prune old archives, keeping only the most recent $MAX_ARCHIVES
ls -1t "$ARCHIVE_DIR"/*.gz 2>/dev/null | tail -n +$((MAX_ARCHIVES+1)) | xargs -r rm --
