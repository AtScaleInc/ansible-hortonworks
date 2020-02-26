#!/bin/bash

export CLOUD_TO_USE=aws
if [ -z $AWS_ACCESS_KEY_ID ] || [-z $AWS_SECRET_ACCESS_KEY ]; then
  echo "MUST DEFINE AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY variables"
  exit 1
fi

cluster_name="magic_cluster_$1"

echo "starting setting up the cloud env for cluster: $cluster_name"
./build_cloud.sh --extra-vars="cluster_name=$cluster_name"

if [[ $? -eq 0 ]]; then
  echo "finishing setting up the cloud env for cluster: $cluster_name after 15 seconds"
  sleep 15
  ./install_cluster.sh --extra-vars="cluster_name=$cluster_name"
fi
