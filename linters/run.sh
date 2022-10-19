#!/usr/bin/env bash

set -o pipefail

function print_header() {
    echo -e "\n***** ${1} *****"
}

function check_log() {
    LOG=$( { ${1}; } 2>&1 )
    STATUS=$?
    echo "$LOG"
    if echo "$LOG" | grep -q -E "${2}"
    then
        exit 1
    fi

    if [ $STATUS -ne 0 ]
    then
        exit $STATUS
    fi
}

print_header "RUN clang-format"
check_log "clang-format --dry-run project/*.cpp project/*.h"

print_header "RUN clang-tidy"
check_log "clang-tidy -checks=-*,clang-analyzer-*,-clang-analyzer-cplusplus* project/*.cpp project/*.h -- -DDEBUG -I ./include"

print_header "RUN cpplint"
check_log "cpplint project/*.cpp project/*.h"

print_header "RUN cppcheck"
check_log "cppcheck -q -j4 --enable=performance,portability,warning,style project/*.cpp project/*.h"

print_header "RUN scan-build"
# check_log "scan-build -o ../project make"

print_header "SUCCESS"
