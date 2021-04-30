#!/bin/bash
CHIA_DIR=/home/boninggao/chia-blockchain
DRY_RUN=true
tmux new -s chia -d
tmux new -s upload -d
rm -f /home/boninggao/tmp/*
tmux send -t chia "cd $CHIA_DIR" ENTER
tmux send -t chia ". ./activate && for i in {1..50}; do /home/boninggao/dplot.sh \$i && tmux send -t upload '/home/boninggao/dupload.sh' ENTER; done" ENTER
