#!/bin/bash

CHIA_DIR=/root/chia-blockchain
DRY_RUN=true
THREAD=3

echo "Number of threads: $THREAD"
echo "Chia blockchain absolute path: $CHIA_DIR"
echo "Is dry run mode: $DRY_RUN"  

for ((i=i;i<$THREAD;i++))
do

SESSION_NAME=test$i
UPLOAD_SESSION=upload$i
echo "Session name is: $SESSION_NAME"

# Open a new tmux session in the back ground
tmux new -s $SESSION_NAME -d
tmux new -s $UPLOAD_SESSION -d

# Open chia blockchain folder
tmux send -t $SESSION_NAME "cd $CHIA_DIR" ENTER

mkdir -p /root/tmp$i
mkdir -p /root/chia/final$i
tmux send -t $SESSION_NAME ". ./activate && sleep ${i}h && for i in {1..50}; do chia plots create -k 32 -b 12000 -r 5 -u 128 -n 1 -t /root/tmp${i} -d /root/chia/final${i} | tee /root/chia${i}.log && FILE=$(cd /root/chia/final${i} && ls *.plot) && IP=$(curl ip.me) && tmux send -t $UPLOAD_SESSION \"ssh homer@hp.qingtan.ltd 'cd /home/homer/Chia/plots && curl $IP/final${i}/$FILE -O' ENTER; done" ENTER
done
