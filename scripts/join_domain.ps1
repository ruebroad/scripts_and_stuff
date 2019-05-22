
$domain = "domain"
$suffix = "dev"
$username = "$domain\admin"

$sec_pwd = ConvertTo-SecureString $1 -AsPlainText -Force

$creds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $sec_pwd

Add-Computer -DomainName "$domain.$suffix" -Credential $creds `
  -OUPath "ou=computers,ou=aws,dc=$domain,dc=$suffix" `
  -PassThru -Verbose -restart 