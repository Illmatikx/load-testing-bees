#!/bin/bash
#===================================================================================
#
# FILE: rtmpbee-publisher.sh
#
# USAGE: rtmpbee-publisher.sh [endpoint] [app] [streamName] [amount of streams to start] [amount of time to playback] [flv-file]
#
# EXAMPLE: ./rtmpbee-publisher.sh ipv6west.red5.org live stream1 10 30 bbb_480p.flv
# LOCAL EXAMPLE: ./rtmpbee-publisher.sh localhost:1935 live stream1 30 10 bbb_480p.flv
#
# DESCRIPTION: Creates N-number of RTMP broadcast with file as a live stream.
#
# OPTIONS: see function ’usage’ below
# REQUIREMENTS: ---
# BUGS: ---
# NOTES: ---
# AUTHOR: Todd Anderson
# COMPANY: Infrared5, Inc.
# VERSION: 1.0.0
#===================================================================================
set -e
endpoint=$1
amount=$2
timeout=$3
file=$4

#=== FUNCTION ================================================================
# NAME: shutdown
# DESCRIPTION: Shutsdown current process
# PARAMETER 1: The PID.
#===============================================================================
function shutdown {
  pid=$1
  file=$2
  for pids in $(ps -ef | awk '/rtmp/ {print $2}'); do kill -9 $pids; done
  echo "Attack ended at $(date '+%d/%m/%Y %H:%M:%S')"
  return 0
}

#=== FUNCTION ================================================================
# NAME: set_timeout
# DESCRIPTION: Set a non-blocking sleep for a PID
# PARAMETER 1: The PID.
# PARAMETER 2: The amount of time to wait before killing process.
#===============================================================================
function set_timeout {
  id=$1
  t=$2
  f=$3
  isLast=$4
  PATH=$PATH:$PWD
  #echo "Will kill ${id} in ${t} seconds..."
  if [ $isLast -eq 1 ]; then
    (sleep "$t"; shutdown "$id" "$f" || echo "Failure to kill ${id}."; return 0)
  else
    (sleep "$t";   for pids in $(ps -ef | awk '/http/ {print $2}'); do kill -9 $pids; done || echo "Failure to kill ${id}.")&
  fi
  return 0
}

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "Attack deployed at $dt"

# Dispatch.
for ((i=0;i<amount;i++)); do
  target=$(curl -s -H "Authorization: $TOKEN" -H "Content-Type: application/json" -X POST $endpoint| jq '.rtmpLink')
  target=$(sed -e 's/^"//' -e 's/"$//' <<<"$target") 
  stream_file="${file}_${i}"
  #for every thread own file copy
  cp "$file" "$stream_file"
  # </dev/null tells ffmpeg to not look for input
  #ffmpeg -re -stream_loop -1 -fflags +genpts -i "$stream_file" -c copy -f flv "$target" 2>/dev/null &
  ffmpeg -re -stream_loop -1 -fflags +genpts -i "$stream_file" -c copy -f flv "$target"&
  isLast=0
  if [ $i -eq $((amount - 1)) ]; then
    isLast=1
  fi
  pid=$!
  echo "Dispatching Bee at $target, PID(${pid})..."
  set_timeout "$pid" "$timeout" "$stream_file" $isLast
  sleep 0.2
done

