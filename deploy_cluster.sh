#!/bin/bash

export CLOUD_TO_USE=aws
export AWS_ACCESS_KEY_ID='AKIA54UMQCLY7AJCZQ2E'
export AWS_SECRET_ACCESS_KEY='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'

cluster_name="magic_cluster_$1"

echo "starting setting up the cloud env for cluster: $cluster_name"
./build_cloud.sh --extra-vars="cluster_name=$cluster_name"

if [[ $? -eq 0 ]]; then
  echo "finishing setting up the cloud env for cluster: $cluster_name after 15 seconds"
  sleep 15
  ./install_cluster.sh --extra-vars="cluster_name=$cluster_name"
fi
