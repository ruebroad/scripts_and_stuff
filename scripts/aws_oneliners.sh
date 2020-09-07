# Get instance names
aws ec2 describe-instances --filter Name="name",Values="*ubunut*" --region eu-west-1

aws ec2 describe-images --filter Name="name",Values="*amazon*" --region eu-west-1

aws ec2 describe-images --image-ids "ami-07683a44e80cd32c5" --region eu-west-1

aws ec2 describe-images --filter Name="name",Values="Windows_Server-2016-English-Full-Base*" --region eu-central-1


# Checking DMS
aws dms describe-replication-instances --filter Name=replication-instance-id,Values="datalakedmsreplicationinstance-fe2ml6gh77b2jf8s" --region eu-west-1

"ReplicationInstanceArn": "arn:aws:dms:eu-west-1:571943706434:rep:UJFNACL3PDWBIQTZPMZFNWHC5I",
"ReplicationInstanceStatus": "available",

aws dms describe-replication-tasks --filter Name=replication-instance-arn,Values="arn:aws:dms:eu-west-1:571943706434:rep:UJFNACL3PDWBIQTZPMZFNWHC5I" --region eu-west-1

prd
aws dms describe-table-statistics --replication-task-arn arn:aws:dms:eu-west-1:571943706434:task:MSSSFTUUKYCI3DHMAO3PRJMKJY --filter Name=table-name,Values=journaltransaction --region eu-west-1

acc
aws dms describe-table-statistics --replication-task-arn arn:aws:dms:eu-west-1:197082791059:task:7A7RTC52BROA7VQAVKQMA73MVQ --filter Name=table-name,Values=accountfiscaldata --region eu-west-1
aws dms reload-tables --replication-task-arn arn:aws:dms:eu-west-1:197082791059:task:7A7RTC52BROA7VQAVKQMA73MVQ --tables-to-reload SchemaName=opamerge,TableName=journalaccount --region eu-west-1
# Change Set Diff
aws cloudformation describe-change-set --stack-name L300-AGN --change-set-name L300-AGN-binrwlic15h-84ou55bh68

opamerge.journaltransaction Table error
opamerge.dgsproduct Table error
opamerge.contact_vs_clientruleengine Table error
opamerge.transaction Table error
opamerge.dgsperson Table error

aws dms describe-table-statistics --replication-task-arn arn:aws:dms:eu-west-1:197082791059:task:7A7RTC52BROA7VQAVKQMA73MVQ --filter Name=table-name,Values=journalaccount --region eu-west-1
aws dms describe-table-statistics --replication-task-arn arn:aws:dms:eu-west-1:197082791059:task:7A7RTC52BROA7VQAVKQMA73MVQ --filter Name=table-name,Values=dgsproduct --region eu-west-1
aws dms describe-table-statistics --replication-task-arn arn:aws:dms:eu-west-1:197082791059:task:7A7RTC52BROA7VQAVKQMA73MVQ --filter Name=table-name,Values=contact_vs_clientruleengine --region eu-west-1
aws dms describe-table-statistics --replication-task-arn arn:aws:dms:eu-west-1:197082791059:task:7A7RTC52BROA7VQAVKQMA73MVQ --filter Name=table-name,Values=transaction --region eu-west-1
aws dms describe-table-statistics --replication-task-arn arn:aws:dms:eu-west-1:197082791059:task:7A7RTC52BROA7VQAVKQMA73MVQ --filter Name=table-name,Values=dgsperson --region eu-west-1

# ECR / ECS
aws ecr describe-images --repository-name l21-jenkins-slave-cfn --image-ids imageTag=latest --region eu-west-1 --registry-id 669720269214

# ACC
# contact_vs_account
aws dms stop-replication-task --replication-task-arn arn:aws:dms:eu-west-1:197082791059:task:ADKA5ZLFH3CJMGOTMUFAHOQGRY --region eu-west-1

# contact_vs_account
aws dms start-replication-task --replication-task-arn arn:aws:dms:eu-west-1:197082791059:task:ADKA5ZLFH3CJMGOTMUFAHOQGRY --region eu-west-1 --start-replication-task-type

# S3 Time limited URL
aws s3 presign s3://customer-xfr-669720269214/agn_export.zip --expires-in 7200 