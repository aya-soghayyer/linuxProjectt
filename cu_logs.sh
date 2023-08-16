#!/bin/bash

LOG_DIR="/path/to/your/log/directory"


TIMESTAMP=$(date +"%Y-%m-%dT%H-%M")


LOG_FILE="$LOG_DIR/kernel-logs-$TIMESTAMP.txt"


journalctl -k -S "1 hour ago" > "$LOG_FILE"


COMPRESSED_FILE="$LOG_DIR/kernel-logs-$TIMESTAMP.tar.bz2"
tar -cjf "$COMPRESSED_FILE" "$LOG_FILE"


dbxcli put "$COMPRESSED_FILE" "/Dropbox/Folder/path/"


rm "$LOG_FILE"



