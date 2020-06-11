#!/bin/bash

#thread groups configuration
#target endpoint
endpoint='https://ceo-perf.oxagile.com/api/v1/video/streams'
#example file for streaming
stream_file='./media_files/example.flv'
#number of publishers
publishers=10
#test duration
duration=60
#pause between starting new publishers
pause=30
###############################
nohup ./rtmpbee-publisher/script/rtmpbee-publisher.sh $endpoint $publishers $duration $stream_file $pause&
