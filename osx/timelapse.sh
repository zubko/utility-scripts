#!/bin/bash
screencapture -m -x -t jpg "$HOME/tmp/$(date '+%Y-%m-%d_%H-%M-%S').jpg"
sleep 10
sh $0
