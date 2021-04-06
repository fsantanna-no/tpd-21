#!/bin/sh

FILE='Peer-to-Peer.md'
PVT1='699299132C4C9AC3E7E78C5C62730AFDD68574D0DFA444D372FFBB51DF1BF1E0A2885F4570903EF5EBA941F3497B08EB9FA9A03B4284D9B27FF3E332BA7B6431'
PUB1='A2885F4570903EF5EBA941F3497B08EB9FA9A03B4284D9B27FF3E332BA7B6431'
PVT2='96700ACD1128035FFEF5DC264DF87D5FEE45FF15E2A880708AE40675C9AD039EEB172ED6C782145B8D4FD043252206192C302E164C0BD16D49EB9D36D5188070'
P1='--port=8401'
P2='--port=8402'

freechains-host $P1 stop
freechains-host $P2 stop
rm -rf /tmp/840[12]
freechains-host $P1 start /tmp/8401 &
freechains-host $P2 start /tmp/8402 &
sleep 0.5

### 8401

echo
echo ">>> [1]: 8401"
echo

mkdir /tmp/8401/local/
cd    /tmp/8401/local/
export PORT=8401
export PVT=$PVT1

freechains $P1 chains join "#$FILE" $PUB1
echo "Peer-to-peer (P2P) computing or networking is..." >> $FILE
freechains-git commit $FILE
echo "Peers make a portion of their resources..."       >> $FILE
freechains-git commit $FILE

### 8402

echo
echo ">>> [2]: 8402"
echo

mkdir /tmp/8402/local/
cd    /tmp/8402/local/
export PORT=8402
export PVT=$PVT2

freechains $P2 chains join "#$FILE" $PUB1
freechains $P2 peer localhost:8401 recv "#$FILE"
freechains-git checkout $FILE
echo "Peer-to-Peer networks do not scale!" >> $FILE
freechains-git commit $FILE
BAD=`freechains $P2 chain "#$FILE" heads blocked`
freechains $P2 chain "#$FILE" like $BAD --sign=$PVT1

### 8401

echo
echo ">>> [3]: 8401"
echo

cd /tmp/8401/local/
export PORT=8401
export PVT='699299132C4C9AC3E7E78C5C62730AFDD68574D0DFA444D372FFBB51DF1BF1E0A2885F4570903EF5EBA941F3497B08EB9FA9A03B4284D9B27FF3E332BA7B6431'

freechains $P1 peer localhost:8402 recv "#$FILE"
freechains-git checkout $FILE
echo
cat $FILE
echo
freechains $P1 chain "#$FILE" dislike $BAD --sign=$PVT1
freechains $P1 chain "#$FILE" dislike $BAD --sign=$PVT1
freechains $P1 chain "#$FILE" dislike $BAD --sign=$PVT1
freechains-git checkout $FILE
echo
cat $FILE
echo
