 Enable-PSRemoting -Force
 Test-WSMan 192.168.1.20
 Invoke-Command -ComputerName 192.168.1.20 -Credential (Get-Credential) -ScriptBlock { Get-ChildItem C:\ }
 Enter-PSSession -ComputerName 192.168.1.20 -Credential (Get-Credential)
 function prompt { "Manjot-singh " }
 exit
