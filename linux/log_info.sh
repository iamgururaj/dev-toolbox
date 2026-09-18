#!/bin/bash
# log_info.sh: Usage log_info "message"

log_info() {
    printf '\033[0;32m%s\033[0m\n' "$*"
}

log_cmd() {
    local rendered=()
    local arg
    for arg in "$@"; do
        rendered+=("$(printf '%q' "$arg")")
    done
    log_info "+ ${rendered[*]}"
}

log_run() {
    log_cmd "$@"
    "$@"
}
