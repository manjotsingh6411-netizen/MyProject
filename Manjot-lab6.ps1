
<#
.SYNOPSIS
    Evaluates a product rating and generates a message.

.DESCRIPTION
    Creates a function named Get-RatingMessage.
    Accepts product name, rating label, comment, score and maximum score.
    Includes mandatory parameters, validation and pipeline support.

.PARAMETER ProductName
    Name of the product.

.PARAMETER RatingLabel
    Product rating.

.PARAMETER Comment
    Product comment.

.PARAMETER Score
    Product score.

.PARAMETER MaxScore
    Maximum product score.

.EXAMPLE
    Get-RatingMessage -ProductName "Laptop" -RatingLabel "Excellent" -Comment "Great product" -Score 8 -MaxScore 10

.NOTES
    Author: Manjot Singh
    Created: 2026-11-04
    Version: 1.0
    Change Log:
    1.0 - Initial release.

.LINK
    https://github.com/manjotsingh6411-netizen/MyProject.git
#>

#Parameters

#Functions

function Get-RatingMessage {

    [CmdletBinding()]
    param(

        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$ProductName,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$RatingLabel,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Comment,

        [Parameter(Mandatory = $true)]
        [ValidateRange(0, 100)]
        [int]$Score,

        [Parameter(Mandatory = $true)]
        [ValidateRange(1, 100)]
        [int]$MaxScore
    )

    process {

        Write-Output "Product $ProductName scored $Score points. This product is doing $RatingLabel."
        Write-Output "Comment: $Comment"
         Write-Output $Message
        Write-Output "Comment: $Comment"

        [PSCustomObject]@{
            ProductName = $ProductName
            RatingLabel = $RatingLabel
            Comment     = $Comment
            Score       = $Score
            MaxScore    = $MaxScore
            Message     = $Message
        } | Export-Csv -Path "C:\Rating-Report.csv" 
    }
}
#Execution Code

Get-RatingMessage -ProductName "Laptop" -RatingLabel "Excellent" -Comment "Great product" -Score 8 -MaxScore 10
