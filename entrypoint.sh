#!/usr/bin/env bash

set -euo pipefail

function log() {
    echo "[$(date +'%H:%M:%S%z')]: $@"
}

function error() {
    echo "[$(date +'%H:%M:%S%z')]: $@" >&2
}

if [ -z "$@" ]; then
    error "No command specified"
    exit 1
fi

log "Running semver with command: '$@'"

ERR_FILE=$(mktemp)
OUT_FILE=$(mktemp)

/usr/local/bin/semver $@ > "$OUT_FILE" 2> "$ERR_FILE"

if [ "$?" -ne 0 ]; then
    error "$(cat $ERR_FILE)"
    exit 1
else
    log "Output: $(cat $OUT_FILE)"
    echo ::set-output name=output::"$(cat $OUT_FILE)"
fi
