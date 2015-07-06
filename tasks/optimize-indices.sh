#!/bin/bash

curator --host $ELASTICSEARCH_HOST optimize --max_num_segments 1 --delay 120 --prefix logstash --older-than 1 --time-unit days