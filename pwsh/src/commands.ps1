function Touch-File {
	Param(
	  [Parameter(Mandatory=$true)]
	  [string]$Path
	)

	if (Test-Path -LiteralPath $Path) {
	  (Get-Item -Path $Path).LastWriteTime = Get-Date
	} else {
	  New-Item -Type File -Path $Path
	}
  }

  # Check if the alias exists
if (-not(Test-Path -Path Alias:Touch)) {
    New-Alias -Name Touch Touch-File -Force
}
