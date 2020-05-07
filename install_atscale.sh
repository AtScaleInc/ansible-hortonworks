#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]}")/set_cloud.sh
source $(dirname "${BASH_SOURCE[0]}")/set_inventory.sh

if [ -z $AWS_ACCESS_KEY_ID ] || [ -z $AWS_SECRET_ACCESS_KEY ]; then
  echo "MUST DEFINE AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY variables"
  exit 1
fi

cluster_name="$1"

ansible-playbook "playbooks/install_atscale.yml" \
                 --inventory="inventory/${inventory_to_use}" \
                 --extra-vars="cloud_name=${cloud_to_use}" \
                 --extra-vars="cluster_name=${cluster_name}"

