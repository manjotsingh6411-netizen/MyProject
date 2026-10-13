 Enter-PSSession -ComputerName 192.168.1.20 -Credential (Get-Credential)
 function prompt {'Manjot-PS'}
Get-process
$processes = Get-Process
$processes
Get-Process | Where-Object{$_.CPU -gt 2000}
$processes | Where-Object($_.CPU -gt 2000)
Get-Process | Sort-Object WorkingSet64 -descending
$processes | Sort-Object WorkingSet64 -descending
$total = 2+2
$total
$total | Get-Member

$total = '2+2'
$total 
$total | Get-member

$num1 = 2
$num2 = 2
$total = $num1 +$num2
$total

$num1 = '2'
$num2 = '2'
$total = $num1 +$num2
$total

[int]$num1 = '2.6'
[int]$num2 = '1.7'
$total = $num1 + $num2

$stringReturn = $total.ToString()
$total | Get-Member


$literal =  ' Two plus one equals: $(1+2)'
$literal
$escaped = "Two plus one equals: $(1+2)"
Write-Host '$escaped' #using single quotes
Write-Host "$escaped" #using double quotes


$env:COMPUTERNAME
$env:USERNAME

$path = Read-Host -Prompt 'Please enter the file path you wish to scan for large files...'
$rawFileData = Get-ChildItem -Path $path -Recurse
$largeFiles = $rawFileData | Where-Object {$_.Length -gt 100MB}
$largeFilesCount = $largeFiles | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "You have $largeFilesCount large file(s) in $path"

$fruit = @('Apples','Oranges','Bananas')
$fruit

$data = @()
$data.Count

$data = @('zero', 'one' , 'two' , 'three')
$data
 $data[0]
 $data[2]
 $data[0,1,2,3]
$data[1..3]
$data[-1]
$data[2] = 'second'

$data | ForEach-Object {"Item: {$PSItem}"}

$data = @('zero', 'one', 'second', 'three')
$data | ForEach-Object {"Item: $_"}

$data = @(
    [pscustomobject]@{FirstName='Kevin'; LastName='Marquette'}
    [pscustomobject]@{FirstName='John'; LastName='Doe'}
)
$data

$data[0]

$data[0].FirstName

$data[0].FirstName = 'Jay'
$data

$data | ForEach-Object {$_.LastName}

$data.LastName

$data = @(1,2,3,4)
$data -join '-'

$data = @('red','green','blue')
$data -contains 'green'

$data = @('red','green','blue')
$data -eq 'green'

$data = @('red','green','blue')
$data -ne 'green'

$first = @('zero', 'one')
$second = @('two', 'three')
$first + $second

$first = @('zero', 'one')
$first += 'Two, Three'
$first

[int[]]$numbers = 1,2,3
$numbers
$numbers.GetType()

[int[]]$numbers = 1,2,3
$numbers += 'Hello'

$myArray = [System.Collections.ArrayList]::new()
[void]$myArray.Add('Value')
$myArray
[void]$myArray.Add('Another Value')
$myArray

$data = [Object[]]::new(4)
$data.Count
$data

$data = @('red','green','blue')
$data * 3

$data = @(
    @(1,2,3),
    @(4,5,6),
    @(7,8,9)
)
$data

$outsideIndex = 0
$insideIndex = 2
$data[$outsideIndex][$insideIndex]

$failedServers = @(
    "SRV-FILE01",
    "SRV-DB01",
    "SRV-WEB01",
    "SRV-FILE01",
    "SRV-APP01",
    "SRV-DB01",
    "SRV-BACKUP01"
)
$failedServers

Write-Host "`nTotal Failure Records: $($failedServers.Count)"

$uniqueServers = $failedServers | Select-Object -Unique
$uniqueServers

if ($uniqueServers -contains "SRV-DB01") {
    Write-Host "SRV-DB01 is in the failure list."
}

$serverList = $uniqueServers -join "; "
$serverList