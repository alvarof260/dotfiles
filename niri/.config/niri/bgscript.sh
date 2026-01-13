#!/bin/bash

pkill awww-daemon

awww-daemon &
awww-daemon -n overlay &

sleep 0.5

awww img "$1"
awww img -n overlay "$1"
