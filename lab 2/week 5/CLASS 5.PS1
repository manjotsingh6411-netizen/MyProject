Enter-PSSession -ComputerName 192.168.1.20 -Credential (Get-Credential)
function prompt {'Manjot-PS'}

Get-netadapter   
Get-netadapter | where-object {$_.Status -eq "up"}
Get-netadapter |select-object NAME, linkspeed, mac-adress|format-table -autosize
Get-netadapter |select-objectNAME; linkspeed; mac-adress|format-table -autosize   
get-dnsclientserveraddress  
Get-netIPConfiguration |Format-Table -AutoSize
Get-netIPConfiguraton -Interfacealias "external Internetconnection" -detailed
Get-netIPConfiguration -Interfacealias "Internalconnection" -detailed

Test-NetConnection 192.168.1.100

Test-NetConnection www.sheridancollege.ca -traceroute -informationlevel detailed 
