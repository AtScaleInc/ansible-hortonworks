#!/bin/bash

export CLOUD_TO_USE=aws
if [ -z $AWS_ACCESS_KEY_ID ] || [-z $AWS_SECRET_ACCESS_KEY ]; then
  echo "MUST DEFINE AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY variables"
  exit 1
fi

for (( i = 1; i <= 3; i++ )); do
  echo "Building cluster $i"
  nohup ./deploy_cluster.sh $i > "logs/build_install_cloud_$i.log" 2>&1 &
  sleep 20
done

