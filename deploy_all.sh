#!/bin/bash

export CLOUD_TO_USE=aws
export AWS_ACCESS_KEY_ID='AKIA54UMQCLY7AJCZQ2E'
export AWS_SECRET_ACCESS_KEY='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'

for (( i = 1; i <= 3; i++ )); do
  echo "Building cluster $i"
  nohup ./deploy_cluster.sh $i > "logs/build_install_cloud_$i.log" 2>&1 &
  sleep 20
done

