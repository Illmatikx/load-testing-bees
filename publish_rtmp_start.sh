#!/bin/bash

#thread groups configuration
#target endpoint
endpoint='https://ceo-perf.oxagile.com/api/v1/video/streams'
#example file for streaming
#stream_file='home/admin/load-testing-bees/media_files/vp6f_288p_25fps.flv'
stream_file='/home/admin/load-testing-bees/media_files/h264_1080p_30fps.mp4'
#stream_file='home/admin/load-testing-bees/media_files/vp8_1080p_30fps.webm'
#stream_file='home/admin/load-testing-bees/media_files/flv1_1080p_25fps.flv'
#number of publishers
publishers=1
#test duration
duration=1800
#pause between starting new publishers
pause=1
###############################
nohup $HOME/load-testing-bees/rtmpbee-publisher/script/rtmpbee-publisher.sh $endpoint $publishers $duration $stream_file $pause&
