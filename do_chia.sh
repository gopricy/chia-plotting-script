#!/bin/bash

CHIA_DIR=/root/chia-blockchain
DRY_RUN=true
tmux new -s chia -d
tmux new -s upload -d
tmux send -t chia "cd $CHIA_DIR" ENTER
tmux send -t chia ". ./activate && for i in {1..50}; do chia plots create -k 32 -b 14000 -r 8 -u 128 -n 1 -t /root/tmp -d /root/chia/final | tee /root/chia.log &&
tmux send -t upload 'rclone copy /root/chia/final/* m:/Chia/ && rm -f /root/chia/final/*' ENTER; done" ENTER
