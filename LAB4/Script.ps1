git add .\LAB4\README-LAB4.md
git commit -m "Add Lab 4 documentation"
git push origin main

$path = "C:\Users\manjo\Reports\ExcelLab"

New-Item -ItemType Directory -Force -Path $path
Copy-Item "C:\Users\manjo\Downloads\Fruits.xlsx" "$path\Fruits.xlsx"
Get-ChildItem $path

Install-Module -Name ImportExcel -Scope CurrentUser
Import-Module ImportExcel
Get-Module -ListAvailable ImportExcel

$fruit = Import-Excel "$path\Fruits.xlsx"
$fruit | Format-Table
$fruit | Get-Member

Get-Process | Export-Excel "$path\ProcessInfo.xlsx" -WorksheetName "Processes"

Import-Excel "$path\ProcessInfo.xlsx" -WorksheetName "Processes" -ImportColumns @(1,46,12,6) -StartRow 1 -EndRow 7

$people = @(
    [PSCustomObject]@{ Name = "Jeremy"; City = "Loxahatchee" }
    [PSCustomObject]@{ Name = "Mike"; City = "Apex" }
    [PSCustomObject]@{ Name = "Kevin"; City = "Cary" }
    [PSCustomObject]@{ Name = "Phil"; City = "Holly Springs" }
)

$people | Format-Table -AutoSize

$people | Export-Excel "$path\ProcessInfo.xlsx" -Append -WorksheetName "People"

$people | Export-Excel "$path\ProcessInfo.xlsx" -Append -WorksheetName "PeopleFormatted" -TableStyle Medium16 -Title "Demo of Table Formatting" -TitleBold

Get-ExcelSheetInfo -Path "$path\ProcessInfo.xlsx"

$data = @(
    [PSCustomObject]@{ Item = "Bananas"; TotalSold = 12 }
    [PSCustomObject]@{ Item = "Blueberries"; TotalSold = 18 }
    [PSCustomObject]@{ Item = "Apples"; TotalSold = 2 }
    [PSCustomObject]@{ Item = "Oranges"; TotalSold = 11 }
    [PSCustomObject]@{ Item = "Pears"; TotalSold = 15 }
    [PSCustomObject]@{ Item = "Cherries"; TotalSold = 9 }
)

$data | Format-Table -AutoSize

$ChartData = New-ExcelChartDefinition -XRange Item -YRange TotalSold -ChartType ColumnClustered -Title "Total Fruit Sales"

$data | Export-Excel "$path\FruitSalesChart.xlsx" -WorksheetName "FruitSalesChart" -ExcelChartDefinition $ChartData -AutoNameRange -Show -Title "Fruit Sales"

Get-ChildItem $path

$session = New-PSSession -ComputerName "192.168.1.20" -Credential "administrator"

$copyParams = @{
    Path = "$path\Fruits.xlsx"
    Destination = "C:\Users\Administrator\Documents\Fruits.xlsx"
    ToSession = $session
}

Copy-Item @copyParams
