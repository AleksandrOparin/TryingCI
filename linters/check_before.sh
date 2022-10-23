#!/usr/bin/env bash

source run.sh

print_header "RUN clang-format"
check_log "clang-format project/*.cpp project/*.h --dry-run --Werror" "Error (?:reading|while processing)"

print_header "RUN clang-tidy"
check_log "clang-tidy project/*.cpp project/*.h -checks=-*,clang-analyzer-*,-clang-analyzer-cplusplus* -warnings-as-errors=* -- -DDEBUG -I ./include" "Error (?:reading|while processing)"

print_header "RUN cpplint"
check_log "cpplint project/*.cpp project/*.h" "Can't open for reading"

print_header "RUN cppcheck"
check_log "cppcheck project/*.cpp project/*.h -q -j4 --enable=performance,portability,warning --error-exitcode=1" "\(information\)"

print_header "RUN infer"
mkdir build
cd build
check_log "infer run -- clang -c ../project/*.cpp ../project/*.h" "Error"
cd ..

print_header "SUCCESS"