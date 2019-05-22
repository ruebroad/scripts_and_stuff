#!/bin/bash

# Copy the private key locally

eval "$(ssh-agent -s)"

ssh-add -l # Should give you a list of cert thumbprints

ssh-add ~/.ssh/<private_key>

ssh -T git@github.com # check if you can connect