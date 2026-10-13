 Enter-PSSession -ComputerName 192.168.1.20 -Credential (Get-Credential)
  function prompt {'Manjot-PS'}
  Get-ADOrganizationalUnit -Filter 'Name -like "*"' |
Format-Table Name, DistinguishedName -AutoSize
New-ADOrganizationalUnit -Name "Department-IT" `
-Path "DC=Manjot,DC=powershell,DC=com"
Get-ADOrganizationalUnit -Filter 'Name -like "*"' |
Format-Table Name, DistinguishedName -AutoSize

New-ADUser -Name "User15" `
-Path "OU=Department-IT,DC=Manjot,DC=powershell,DC=com" `
-UserPrincipalName "User15@Manjot.powershell.com" `
-AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
-Enabled $true `
-ChangePasswordAtLogon $true

Get-ADUser -Filter * | Select-Object Name

Enter-PSSession -ComputerName 192.168.1.20 -Credential (Get-Credential)
$session = New-PSSession 192.168.1.20 -credential (Get-Credential)
$copyParams = @{
   Path        = "C:\Users\manjo\Downloads\Users.csv"
   Destination = "C:\Users\Administrator\Documents\Users.csv"
   ToSession   = $session
}
Copy-Item @copyParams

import-csv "C:\Users\manjo\Documents\Users.csv" | ForEach-Object {
$NewUserParameters =@{
'GivenName'= $_.FirstName
'Surname' = $_.LastName
'Name' = $_.UserName
"UserPrincipalName" = $_.UserPrincipalName
"AccountPassword" = (ConvertTo-SecureString "p@33w0rd" -asPlainText -Force)
}
New-ADUser @NewUserParameters -PassThru | Enable-ADAccount
}

 Manjot-PSGet-ADOrganizationalUnit -Filter 'Name -like "*"' |
>> Format-Table Name,DistinguishedName -AutoSize


Get-ADUser -SearchBase "OU=Department-IT,DC=manjot,DC=powershell,DC=com" -Filter * |
Select-Object Name,UserPrincipalName,Enabled

Get-ADUser -Filter * | Select Name



Get-ADUser -SearchBase "OU=Department-IT,DC=manjot,DC=powershell,DC=com" -Filter * |
Select-Object Name,UserPrincipalName


Get-ADUser -SearchBase "OU=Department-IT,DC=manjot,DC=powershell,DC=com" -Filter *
$session = New-PSSession 192.168.1.20 -Credential (Get-Credential)

$copyParams = @{
    Path        = "C:\Users\manjo\Downloads\Users (1).csv"
    Destination = "C:\Users\Administrator\Documents\Users.csv"
    ToSession   = $session
}

Copy-Item @copyParams

Enter-PSSession -ComputerName 192.168.1.20 -Credential (Get-Credential)
Get-ADUser -SearchBase "OU=Department-IT,DC=manjot,DC=powershell,DC=com" -Filter * |
Select-Object Name,UserPrincipalName

Import-Csv "C:\Users\Administrator\Documents\Users.csv" |
Select-Object UserName,UserPrincipalName

Import-Csv "C:\Users\Administrator\Documents\Users.csv" | ForEach-Object {
    $NewUserParameters = @{
        'GivenName' = $_.FirstName
        'Surname' = $_.LastName
        'Name' = $_.UserName
        'UserPrincipalName' = $_.UserPrincipalName
        'AccountPassword' = (ConvertTo-SecureString "p@33w0rd" -AsPlainText -Force)
        'Path' = "OU=Department-IT,DC=Manjot,DC=powershell,DC=com"
        'Enabled' = $true
    }

    New-ADUser @NewUserParameters -PassThru
}

$UserNames = @(
    "jdoe",
    "jsmith",
    "mbrown",
    "edavis",
    "dwilson",
    "staylor",
    "canderson",
    "lthomas",
    "dwhite",
    "omartin"
)

foreach ($UserName in $UserNames) {
    Set-ADUser -Identity $UserName -UserPrincipalName "$UserName@Manjot.powershell.com"
}

Get-ADUser -SearchBase "OU=Department-IT,DC=Manjot,DC=powershell,DC=com" -Filter * |
Select-Object Name,UserPrincipalName,Enabled


Get-ADUser -SearchBase "OU=Department-IT,DC=Manjot,DC=powershell,DC=com" -Filter * |
Select-Object Name,UserPrincipalName,Enabled