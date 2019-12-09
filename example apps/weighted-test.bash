#!/bin/bash

for i in {1..10}
do
    curl -s weighted.eqslearning.com | grep nginx- | awk -F '>' '{print $5}' | awk -F '<' '{print$1}