#!/bin/bash

CHIA_DIR=/root/chia-blockchain
DRY_RUN=true
tmux new -s chia -d
tmux send -t chia "cd $CHIA_DIR" ENTER
tmux send -t chia '. ./activate && for i in {1..5}; do touch /root/chia/final/random.plot && FILE=$(cd /root/chia/final && ls *.plot) && IP=$(curl ip.me) && echo $FILE && echo $IP && ssh homer@hp.qingtan.ltd "cd /home/homer/Chia/plots && curl -b boning:983556 $IP:60/chia/final/$FILE -O" && rm -f /root/chia/final/*; done' ENTER
