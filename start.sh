#!/bin/bash
CHIA_DIR=/home/fak_homer/chia-blockchain
DRY_RUN=true
tmux new -s chia -d
tmux new -s upload -d
rm -f /home/fak_homer/tmp/*
tmux send -t chia "cd $CHIA_DIR" ENTER
tmux send -t chia ". ./activate && for i in {1..50}; do /home/fak_homer/chia-plotting-script/plot.sh \$i && tmux send -t upload '/home/fak_homer/chia-plotting-script/upload.sh' ENTER; done" ENTER
