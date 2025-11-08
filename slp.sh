#!/bin/bash

# slp.sh (Serial Log Pipe)
LOG_FILE="$1"
LOCK_FILE="${LOG_FILE}.lock"

# Check if a log file was provided
if [ -z "$LOG_FILE" ]; then
    echo "Usage: YourApp | slp.sh /path/to/log.file" >&2
    exit 1
fi

# Acquire an exclusive lock on a separate file descriptor (200)
# -x: exclusive lock
# -w: wait for the lock (essential for serialisation)
(
    flock -x -w 5 200 || { echo "ERROR: Timeout acquiring lock for $LOG_FILE" >&2; exit 1; }

    # Read from the pipe (stdin) and append directly to the log file.
    # The flock command holds the lock *while* the 'cat' is reading and writing.
    cat >> "$LOG_FILE"

) 200>"$LOCK_FILE"
