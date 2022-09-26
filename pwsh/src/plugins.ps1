Invoke-Expression (oh-my-posh --init --shell pwsh --config "$PSScriptRoot/.hanselman.omp.json")

Import-Module -Name Terminal-Icons

# setup autocompletes
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Azure module
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery
