#!/bin/bash
$(aws ecr get-login --no-include-email --region eu-west-1)
docker tag flaskapi:latest 7715****472.dkr.ecr.eu-west-1.amazonaws.com/flaskapi:latest
docker push 7715****472.dkr.ecr.eu-west-1.amazonaws.com/flaskapi:latest

########
#
# Assumes that flaskapi:latest is available locally