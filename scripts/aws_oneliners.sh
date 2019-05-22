# Get instance names
aws ec2 describe-instances --filter Name="name",Values="*ubunut*" --region eu-west-1

aws ec2 describe-images --filter Name="name",Values="*amazon*" --region eu-west-1

aws ec2 describe-images --image-ids "ami-07683a44e80cd32c5" --region eu-west-1

