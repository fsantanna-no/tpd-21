#!/bin/sh

case $3 in
    "start" )
        for i in $(seq $1 $2); do
            freechains-host --port=$i start /tmp/fc-$i &
        done
        ;;
    "stop" )
        for i in $(seq $1 $2); do
            freechains-host --port=$i stop
        done
        ;;
    "join" )
        for i in $(seq $1 $2); do
            freechains --port=$i chains join $4
        done
        ;;
    "leave" )
        for i in $(seq $1 $2); do
            freechains --port=$i chains leave $4
        done
        ;;
    "consensus" )
        for i in $(seq $1 $2); do
            echo "### $i"
            freechains --port=$i chain $4 consensus | sed 's/ /\n/g' | tee /tmp/cons-$i.txt | wc
        done
        ;;
    "sync" )
        for i in $(seq $1 $2); do
            for j in $(seq $1 $2); do
                echo "### $i -> $j"
                freechains --port=$i peer localhost:$j send $4
                freechains --port=$i peer localhost:$j recv $4
            done
        done
        ;;
esac
