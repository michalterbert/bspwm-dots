#!/bin/bash

cd /home/dicha/Pictures/Scrot/; \
scrot -q 100 iScrot-%Y-%m-%d-%H_%M.png; \
cd /home/dicha; \
notify-send "Screenshot has been taken."
