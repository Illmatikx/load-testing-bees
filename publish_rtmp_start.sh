#!/bin/bash

#thread groups configuration
#target endpoint
endpoint='https://ceo-perf.oxagile.com/api/v1/video/streams'
#example file for streaming
#stream_file='./media_files/vp6f_288p_25fps.flv'
stream_file='./media_files/h264_1080p_30fps.mp4'
#stream_file='./media_files/vp8_1080p_30fps.webm'
#number of publishers
publishers=10
#test duration
duration=60
#pause between starting new publishers
pause=30
###############################
nohup ./rtmpbee-publisher/script/rtmpbee-publisher.sh $endpoint $publishers $duration $stream_file $pause&
