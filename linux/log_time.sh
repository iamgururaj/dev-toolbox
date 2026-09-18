#!/bin/bash
# log_time.sh: Usage log_time <start> <end> or ./log_time.sh <start> <end>
log_time() {
    local start=$1
    local end
    if [[ -z "$start" ]]; then
        echo "Usage: log_time <start>"
        return 1
    fi
    end=$(date +%s%N)
    local duration_ms=$(( (end - start) / 1000000 ))
    local seconds=$(echo "scale=3; $duration_ms/1000" | bc)
    echo "Time taken: ${seconds}s (${duration_ms}ms)"
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    if [[ $# -ne 1 ]]; then
        echo "Usage: $0 <start>"
        exit 1
    fi
    log_time "$1"
fi
