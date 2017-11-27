#!/bin/sh
echo "\033[34mRunning Rspec tests\033[0m"
RUN_CHECK_CMD='bundle exec rspec spec -fd'
RUN_TESTS_OUTPUT=`${RUN_CHECK_CMD}`

