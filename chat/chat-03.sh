#!/bin/sh

case $1 in
    "start" )
        for i in $(seq 8501 8510); do
            freechains-host --port=$i start /tmp/fc-$i &
        done
        ;;
    "stop" )
        for i in $(seq 8501 8510); do
            freechains-host --port=$i stop
        done
        ;;
    "join" )
        for i in $(seq 8501 8510); do
            freechains --port=$i chains join $2
        done
        ;;
    "leave" )
        for i in $(seq 8501 8510); do
            freechains --port=$i chains leave $2
        done
        ;;
    "consensus" )
        for i in $(seq 8501 8510); do
            echo "### $i"
            freechains --port=$i chain $2 consensus | sed 's/ /\n/g' | tee /tmp/cons-$i.txt | wc
        done
        ;;
    "sync" )
        for i in $(seq 8501 8510); do
            for j in $(seq 8501 8510); do
                echo "### $i -> $j"
                freechains --port=$i peer localhost:$j send $2
                freechains --port=$i peer localhost:$j recv $2
            done
        done
        ;;
esac
