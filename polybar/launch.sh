#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar
polybar bar 2>&1 | tee -a /tmp/polybar.log & disown
