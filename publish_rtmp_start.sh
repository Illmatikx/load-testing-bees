#!/bin/bash

#thread groups configuration
#target endpoint
endpoint="https://ceo-perf.oxagile.com/api/v1/video/streams"
#example file for streaming
#stream_file='home/admin/load-testing-bees/media_files/vp6f_288p_25fps.flv'
stream_file='/home/admin/load-testing-bees/media_files/h264_1080p_30fps.mp4'
#stream_file='home/admin/load-testing-bees/media_files/vp8_1080p_30fps.webm'
#stream_file='home/admin/load-testing-bees/media_files/flv1_1080p_25fps.flv'
#number of publishers
publishers=1
#test duration
duration=900
#pause between starting new publishers
pause=1
#session_id
session_id="8869445c-8344-46d5-a034-0f4410798221"
#rtmp stream url
stream_url='replaceme'
###############################
nohup $HOME/load-testing-bees/rtmpbee-publisher/script/rtmpbee-publisher.sh $endpoint $publishers $duration $stream_file $pause $session_id&
