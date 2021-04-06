#!/bin/sh

FILE='Peer-to-Peer.md'
PUB1='A2885F4570903EF5EBA941F3497B08EB9FA9A03B4284D9B27FF3E332BA7B6431'
PVT1='699299132C4C9AC3E7E78C5C62730AFDD68574D0DFA444D372FFBB51DF1BF1E0A2885F4570903EF5EBA941F3497B08EB9FA9A03B4284D9B27FF3E332BA7B6431'
PUB2='146754D26A9B803138D47B62C92D9542343C22EB67BFFA9C429028985ED56C40'
PVT2='320B59D3B1C969E20BD10D1349CEFECCD31B8FB84827369DCA644E780F004EA6146754D26A9B803138D47B62C92D9542343C22EB67BFFA9C429028985ED56C40'
P1='--port=8401'
P2='--port=8402'

freechains-host $P1 stop
freechains-host $P2 stop
rm -rf /tmp/840[12]
freechains-host $P1 start /tmp/8401 &
freechains-host $P2 start /tmp/8402 &
sleep 0.5
freechains-host $P1 now 0
freechains-host $P2 now 0

### 8401

echo
echo ">>> [1]: 8401"
echo

mkdir /tmp/8401/local/
cd    /tmp/8401/local/
export PORT=8401

freechains $P1 chains join "#$FILE" $PUB1 $PUB2
echo "Peer-to-peer (P2P) networking is..." >> $FILE
freechains-git commit $FILE $PVT1
echo "Peers make a portion of their resources..." >> $FILE
freechains-git commit $FILE $PVT1

freechains-host $P1 now 90000000
freechains-host $P2 now 90000000

### 8402

echo
echo ">>> [2]: 8402"
echo

mkdir /tmp/8402/local/
cd    /tmp/8402/local/
export PORT=8402

freechains $P2 chains join "#$FILE" $PUB1 $PUB2
freechains $P2 peer localhost:8401 recv "#$FILE"
freechains-git checkout $FILE
echo "Peer-to-Peer networks do not scale!" >> $FILE
BAD=`freechains-git commit $FILE $PVT2`

### 8401

echo
echo ">>> [3]: 8401"
echo

cd /tmp/8401/local/
export PORT=8401
export PVT=$PVT1

freechains $P1 peer localhost:8402 recv "#$FILE"
freechains-git checkout $FILE
echo
cat $FILE
echo
echo ">>>"
echo $BAD
echo "<<<"
freechains $P1 chain "#$FILE" dislike $BAD --sign=$PVT1
freechains $P1 chain "#$FILE" dislike $BAD --sign=$PVT1
freechains $P1 chain "#$FILE" dislike $BAD --sign=$PVT1
freechains-git checkout $FILE
echo
cat $FILE
echo

### CONFLICT

freechains $P1 peer localhost:8402 send "#$FILE"

cd /tmp/8401/local/
export PORT=8401
freechains-git checkout $FILE
sed -i 's/peer/Peer/g' Peer-to-Peer.md
freechains-git commit $FILE $PVT1

cd /tmp/8402/local/
export PORT=8402
freechains-git checkout $FILE
sed -i 's/networking/computing/g' Peer-to-Peer.md
freechains-git commit $FILE $PVT2

freechains $P1 peer localhost:8402 send "#$FILE"
freechains $P1 peer localhost:8402 recv "#$FILE"

cd /tmp/8401/local/
export PORT=8401
export PVT=$PVT1
freechains-git checkout $FILE
echo
cat $FILE
echo

cd /tmp/8402/local/
export PORT=8402
export PVT=$PVT2
freechains-git checkout $FILE
echo
cat $FILE
echo

#freechains $P1 chain "#$FILE" reps $PUB1
#freechains $P2 chain "#$FILE" reps $PUB2
