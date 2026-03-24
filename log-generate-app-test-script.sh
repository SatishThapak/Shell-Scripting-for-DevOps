#!/bin/bash

# Use a directory inside your home folder
APP_LOG_DIR="$HOME/Shell-Scripting-for-DevOps/myapp/logs"
mkdir -p "$APP_LOG_DIR"

LOG_FILE="$APP_LOG_DIR/app.log"

echo "Starting demo app... Logs will be written to $LOG_FILE"

for i in {1..50}; do
    echo "$(date '+%Y-%m-%d %H:%M:%S') - INFO - Event $i processed successfully" >> "$LOG_FILE"
    sleep 1
done

echo "Demo app finished. Check $LOG_FILE for logs."
