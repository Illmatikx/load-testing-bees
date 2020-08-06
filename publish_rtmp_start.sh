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
duration=900
#pause between starting new publishers
pause=1
#project_id
project_id='4626075d_ebf7_4ffa_8292_085f652040de'
#publisher_id
user_id='78703dfd-887a-4d37-b74c-3d1ce3ada302'
#session_id
session_id='fc94fd45-8aba-421a-94f9-6624a3dcf760'
###############################
nohup $HOME/load-testing-bees/rtmpbee-publisher/script/rtmpbee-publisher.sh $endpoint $publishers $duration $stream_file $pause $session_id $project_id $user_id&
