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
#authorization token
export TOKEN='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwicHJqIjoiSm9obiBEb2UiLCJ1c3IiOiJMQUxBTEEifQ.Ya3itUC81652DpzXpcNf6DryygSjrFHeCILfrmSPCyo'
#path for ffmpeg
PATH=$PATH:$PWD
###############################
nohup ./rtmpbee-publisher/script/rtmpbee-publisher.sh $endpoint $publishers $duration $stream_file&
