#!/usr/bin/bash

cd ~/rpi-rgb-led-matrix/examples-api-use

COL_RED="255,0,0"
COL_GREEN="0,255,0"
COL_BLUE="0,0,255"
COL_MAGENTA="255,0,255"
COL_YELLOW="255,255,0"
COL_CYAN="0,255,255"

FONT_PATH="../fonts/10x20.bdf"
FONT_Y_OFFSET=6

MSG_SPEED=5

MSG_WELCOME="WELCOME TO CODER DOJO - CODING CAN BE FUN! - PLEASE COME AND TRY!"

OPTS="--led-rows=32 --led-cols=64 --led-slowdown-gpio=3 --led-pixel-mapper=Rotate:180"

function print()
{
    TEXT=$1
    COLOR=$2

    ./scrolling-text-example ${OPTS} -f ${FONT_PATH} -y ${FONT_Y_OFFSET} -s ${MSG_SPEED} -C ${COLOR} -l 1 "${TEXT}"
}

function do_text()
{
    ./demo ${OPTS} -D1 runtext.ppm &
    pid=$!
    sleep 15.5
    kill ${pid}
}

function do_square()
{
    ./demo ${OPTS} -D0 &
    pid=$!
    sleep 15
    kill ${pid}
}

function do_conway()
{
    ./demo ${OPTS} -D7 -m 200 &
    pid=$!
    sleep 60
    kill ${pid}
}

function do_volume_bars()
{
    ./demo ${OPTS} -D9 -m 1000 &
    pid=$!
    sleep 30
    kill ${pid}
}

while true; do
    print "${MSG_WELCOME}" ${COL_RED}
    do_text
    print "${MSG_WELCOME}" ${COL_GREEN}
    do_square
    print "${MSG_WELCOME}" ${COL_BLUE}
    do_conway
    print "${MSG_WELCOME}" ${COL_YELLOW}
    do_volume_bars
done
