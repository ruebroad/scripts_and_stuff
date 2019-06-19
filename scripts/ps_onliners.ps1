# Tail log file
Get-Content c:\chef\log\client.log -Wait -Tail 30

# get ad groups for user
Get-ADPrincipalGroupMembership username | select name