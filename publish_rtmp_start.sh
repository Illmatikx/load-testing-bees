#!/bin/bash

#thread groups configuration
#target endpoint
endpoint='https://perf-dev.stagepro.io/api/v1/video/streams'
#example file for streaming
#stream_file='home/admin/load-testing-bees/media_files/vp6f_288p_25fps.flv'
stream_file='/home/admin/load-testing-bees/media_files/h264_1080p_30fps.mp4'
#stream_file='/home/admin/load-testing-bees/media_files/h264_1080p_60fps.mp4'
#stream_file='home/admin/load-testing-bees/media_files/vp8_1080p_30fps.webm'
#stream_file='home/admin/load-testing-bees/media_files/flv1_1080p_25fps.flv'
#number of publishers
publishers=1
#test duration
duration=600
#pause between starting new publishers
pause=1
#session_id
session_id="16ff724b-cf8a-45db-9e63-130adcd1341d"
###############################
nohup $HOME/load-testing-bees/rtmpbee-publisher/script/rtmpbee-publisher.sh $endpoint $publishers $duration $stream_file $pause $session_id&
