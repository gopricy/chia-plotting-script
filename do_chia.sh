#!/bin/bash

CHIA_DIR=/root/chia-blockchain
DRY_RUN=true
tmux new -s chia -d
tmux send -t chia "cd $CHIA_DIR" ENTER
tmux sent -t chia ". ./activate && for i in {1..5}; do chia plots create -k 32 -b 12000 -r 5 -u 128 -n 1 -t /root/tmp -d /root/chia/final | tee /root/chia.log && FILE=$(cd /root/chia/final && ls *.plot) && ssh homer@hp.qingtan.ltd cd /home/homer/Chia && curl -b boning:983556 $(curl ip.me):60/chia/final/$FILE -O && rm /root/chia/final; done" ENTER
