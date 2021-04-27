#!/bin/bash

CHIA_DIR=/root/chia-blockchain
DRY_RUN=true
tmux new -s chia -d
tmux send -t chia "cd $CHIA_DIR" ENTER
tmux send -t chia ". ./activate && for i in {1..5}; do touch /root/chia/final/random${i}.plot && FILE=$(cd /root/chia/final && ls *.plot) && IP=$(curl ip.me) && echo $FILE && echo $IP && tmux new -s upload && tmux send -t upload \"rclone copy /root/chia/final/* g:/Chia/\" && rm -f /root/chia/final/*;\" done" ENTER
