#!/bin/bash

# $1 = account name - see ~/.aws/accounts

# export AWS_ROLE_SESSION_TIMEOUT=43200

source $(which assume-role)

echo $1

if [ $1 == "new_stack" ]; then
  role="administrator"
else 
  role="AdminAccessFromAWSBeheer"
fi
echo "Using role $role for account $1"

assume-role $1 $role

