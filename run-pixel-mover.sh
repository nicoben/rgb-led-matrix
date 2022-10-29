#!/usr/bin/bash

cd ~/rpi-rgb-led-matrix/examples-api-use

./pixel-mover --led-rows=32 --led-cols=64 --led-slowdown-gpio=3 --led-pixel-mapper=Rotate:180 $*
