#!/bin/bash
#
# Convenience script for NOS3 development
#

SCRIPT_DIR=$(cd `dirname $0` && pwd)
BASE_DIR=$(cd `dirname $SCRIPT_DIR`/.. && pwd)

# cFS
killall -q -r -9 core-cpu*

# COSMOS
killall -q -9 ruby
yes | rm $BASE_DIR/gsw/cosmos/Gemfile 2> /dev/null
yes | rm $BASE_DIR/gsw/cosmos/Gemfile.lock 2> /dev/null
yes | rm -r $BASE_DIR/gsw/cosmos/COMPONENTS 2> /dev/null

# NOS3
killall -q -r -9 'nos3.*simulator.*'
killall -q -r -9 nos3-*
killall -q nos_engine_server_standalone
killall -q nos-time-driver

# NOS3 GPIO
rm -rf /tmp/gpio_fake

# NOS3 Stored HK
rm -rf $BASE_DIR/fsw/build/exe/cpu1/scratch/*

# 42
killall -q 42
rm -rf /opt/nos3/42/NOS3InOut
rm -rf /tmp/gpio*

exit 0