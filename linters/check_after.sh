#!/usr/bin/env bash

. $(dirname "$0")/run.sh

print_header "RUN scan-build"
cd build
check_log "scan-build --show-description --status-bugs -stats -o ./project make -j4" "Error"
cd ..

print_header "RUN infer"
cd build
check_log "infer run -- clang -c ../project/*.cpp ../project/*.h" "Error"
cd ..

print_header "SUCCESS"