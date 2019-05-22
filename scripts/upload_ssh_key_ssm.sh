
# Paramters
# $1 = path to pem file
# $2 = SSM Parameter path - full path incl name of parameter
# $3 = Description - can be ""

ssm_path=$1
pem_file=$2
description=$3
region=$4

aws ssm put-parameter \
        --name "$ssm_path" \
        --type SecureString \
        --description "$description" \
        --value "`cat $pem_file`" \
        --region $region \
        --overwrite

# Example
# ./upload_ssh_pem_to_ssm.sh /excp/test/test_pem ~/.chef/chefadmin2.pem "" eu-west-1

# Sources: 
# https://blog.rubiconred.com/removing-ssh-pem-files-from-jump-boxes-in-aws-part-2-getting-it-working/
# https://alestic.com/2018/12/aws-ssm-parameter-store-git-key/