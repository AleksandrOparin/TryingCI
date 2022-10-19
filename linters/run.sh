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
check_log "clang-format project/*.cpp project/*.h --dry-run --Werror" "Error (?:reading|while processing)"

print_header "RUN clang-tidy"
check_log "clang-tidy project/*.cpp project/*.h -checks=-*,clang-analyzer-*,-clang-analyzer-cplusplus* -warnings-as-errors=* -- -DDEBUG -I ./include" "Error (?:reading|while processing)"

print_header "RUN cpplint"
check_log "cpplint project/*.cpp project/*.h" "Can't open for reading"

print_header "RUN cppcheck"
check_log "cppcheck project/*.cpp project/*.h -q -j4 --enable=performance,portability,warning,style --error-exitcode=1" "\(information\)"

print_header "RUN scan-build"
# cd build
# check_log "scan-build --show-description --status-bugs -stats -o ./project make -j4" "Error"
# cd ..

print_header "RUN infer"
# cd build
check_log "infer run -- clang -c project/fib.cpp"
# cd ..

print_header "SUCCESS"
