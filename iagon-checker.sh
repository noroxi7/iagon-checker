#!/bin/bash

log() {
    echo "[$(date -u '+%Y-%m-%d %H:%M:%S UTC')] $1"
}

STATUS=$(iagon-node service status)

if echo "$STATUS" | grep -qi "stopped"; then
    log "Service stopped. Starting..."
    echo "yes" | sudo iagon-node service start
    log "Start command executed."
elif echo "$STATUS" | grep -qi "running"; then
    log "Service running. Nothing to do."
else
    log "Unknown status: $STATUS"
fi