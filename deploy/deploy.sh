#! /bin/bash
set -e

if [ -z "$1" ] ; then echo "Usage: Specify deployment file"; fi

# parse configuration from environment specific file
echo  "Parsing config file $1 ..."

# Create resources
echo "Creating resources ..."

# Pull docker image in the instance created
echo "Pulling docker image ..."

# Run docker container in the instance created
echo "Runing docker container ..."
