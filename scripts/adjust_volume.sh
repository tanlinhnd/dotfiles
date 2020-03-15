#!/bin/bash

MODE=$1
VOLUME_UP='+5%'
VOLUME_DOWN='-5%'

for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`
do
	if [ "$MODE" == "up" ]; then
		pactl set-sink-volume $SINK $VOLUME_UP
	elif [ "$MODE" == "down" ]; then
		pactl set-sink-volume $SINK $VOLUME_DOWN
	else
		pactl set-sink-mute $SINK toggle
	fi
done
