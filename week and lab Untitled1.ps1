Get-Command
GET-date | format-table
GET-date | format-list
GET-date | get-member
pwd
Get-NetAdapter
#Getting basic information about the Server
Get-ComputerInfo | Select-Object CsName, OsName, OsVersion, OsArchitecture


#Getting the hostname of the server
$env:COMPUTERNAME


#Getting the Domain information of the server
Get-ComputerInfo | Select-Object CsName, CsDomain, CsWorkgroup,CsDomainRole


#Getting the Processor, Memory and Operating System information of the server
Get-CimInstance Win32_Processor | Format-List
Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
Get-CimInstance Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
Get-PSDrive -PSProvider FileSystem
Get-NetAdapter
Get-NetIPAddress | Select-Object IPAddress, AddressFamily


#Getting the list of installed roles and features on the server
Get-WindowsFeature
Get-WindowsFeature -Name AD-Domain-Services

Get-NetIPAddress | Select-Object IPAddress,InterfaceAlias



Invoke-Command -ComputerName 192.168.1.20 -ScriptBlock { Get-ChildItem C:\ } -credential domain\username
Enter-PSSession -ComputerName 192.168.1.20 -Credential administrator
cd C:\Users\Administrator
exit










Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools

Install-ADDSForest -DomainName '<Manjot>.powershell.com'
It will restart the Server. Log in again now use the credentials <firstname>.powershell.com\administrator
Enter-PSSession -ComputerName 192.168.1.20 -Credential Manjot.powershell.com\administrator

Get-ComputerInfo | Select-Object CsName, CsDomain, CsWorkgroup,CsDomainRole
