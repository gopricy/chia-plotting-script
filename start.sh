#!/bin/bash
CHIA_DIR=/home/boning/chia-blockchain
DRY_RUN=true
tmux new -s chia -d
tmux new -s upload -d
rm -f /home/boning/ssd/tmp/*
tmux send -t chia "cd $CHIA_DIR" ENTER
tmux send -t chia ". ./activate && for i in {1..50}; do /home/boning/chia-plotting-script/$1plot.sh \$i && tmux send -t upload '/home/boning/chia-plotting-script/upload.sh' ENTER; done" ENTER
