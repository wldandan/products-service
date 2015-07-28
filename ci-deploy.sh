#! /bin/bash
set -e

if [ -z "$1" ] ; then echo "Usage: Specify environment"; fi
./deploy/deploy.sh "deploy/deploy-$1.yml"
