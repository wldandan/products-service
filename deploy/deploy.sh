#! /bin/bash
set -e

[[ -z "$1" ]] && echo "Usage: Please Specify deployment file !!!" && exit 1

# parse configuration from environment specific file
echo  "Parsing config file $1 ..."

# Create resources
echo "Creating resources ..."

# Pull docker image in the instance created
echo "Pulling docker image ..."

# Run docker container in the instance created
echo "Runing docker container ..."
