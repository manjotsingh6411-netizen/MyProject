Write-Host "Hello World!"
C:\users\manjo\desktop\MyFirstScript.ps1
Get-ExecutionPolicy -List
Get-Date
Get-Date -format hh\:mm\:ss
Function Get-Time
{
    Get-Date -Format "HH:mm"
}

Get-Time
Get-Module -ListAvailable

Get-Command

Get-Command -Name *IP*

Get-Command -Module NetTCPIP -Name *IP*



Start-Process notepad.exe

$NotepadProc = Get-Process -Name notepad

$NotepadProc.WaitForExit()

Start-Process calc.exe
Get-Process | Get-Member


Get-Help Format-Table
Get-Help -Name Format-Table
Format-Table -?


Get-Help Format-Table -Detailed
Get-Help Format-Table -Full



Get-Help Format-Table -Examples
Get-Help Format-Table -Online
Get-Help Format-Table -Parameter *
Get-Help Get-ChildItem -Parameter *
Get-Help Format-Table -Parameter GroupBy


Get-Help about_*


Get-Help -Name remoting






PS C:\Users\manjo> $module = Invoke-Command -ComputerName 192.168.1.20 -Credential (Get-Credential) -ScriptBlock { Get-Module -Name Microsoft.PowerShell.Management -ListAvailable }; Save-Help -Module $module.Name -DestinationPath "C:\Users\manjo\Desktop\POWER SHELL"

$modulename = ""
$module = Invoke-Command -ComputerName RemoteServer -ScriptBlock { Get-Module -Name $modulename -ListAvailable }
Save-Help -Module $module -DestinationPath "C:\SavedHelp"

 Enable-PSRemoting -Force