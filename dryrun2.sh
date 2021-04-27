#!/bin/bash

CHIA_DIR=/root/chia-blockchain
DRY_RUN=true
tmux new -s chia -d
tmux new -s upload -d
tmux send -t chia "cd $CHIA_DIR" ENTER
tmux send -t chia ". ./activate && for i in {1..5}; do touch /root/chia/final/random$i.plot && tmux send -t upload 'rclone copy /root/chia/final/* g:/Chia/ && rm -f /root/chia/final/*' ENTER && sleep 60; done" ENTER
