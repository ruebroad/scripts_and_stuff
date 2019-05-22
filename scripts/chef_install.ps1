Invoke-Expression ((New-Object net.webclient).downloadstring('https://omnitruck.chef.io/install.ps1'))
Install-Project -project chef -channel stable -daemon task 