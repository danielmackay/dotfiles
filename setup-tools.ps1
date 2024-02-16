param
(

    [Parameter(Position = 0, Mandatory, HelpMessage="Install minimal tools: (y/N)")]
    [ValidateNotNullOrEmpty()]
    [string]$installMinimal,

    [Parameter(Position = 1, Mandatory, HelpMessage="Install dev tools: (y/N)")]
    [ValidateNotNullOrEmpty()]
    [string]$installDev,

    # [Parameter(Position = 2, Mandatory, HelpMessage="Install paid tools: (y/N)")]
    # [ValidateNotNullOrEmpty()]
    # [string]$installPaid,

	[Parameter(Position = 3, Mandatory, HelpMessage="Install other tools: (y/N)")]
    [ValidateNotNullOrEmpty()]
    [string]$installOther
)

# Configuration

$minimalTools = @(
	#'7zip.7zip',
	'Git.Git',
	'JanDeDobbeleer.OhMyPosh',
	#'Notepad++.Notepad++',
    #'Microsoft.PowerToys',
	'Microsoft.Powershell'
	'Microsoft.VisualStudioCode',
	'9MV51B301WFD' # Working Hours (Time Tracker)
)

$devTools = @(
	'Microsoft.AzureCLI',
	'Docker.DockerDesktop',
	#eartrumpet (TODO)
	'GitHub.cli',
	'Insomnia.Insomnia',
	#'LINQPad.LINQPad.7',
	'OpenJS.NodeJS.LTS',
	'CoreyButler.NVMforWindows',
	#'RicoSuter.NSwagStudio',
	#'Postman.Postman',
	'ScooterSoftware.BeyondCompare4',
	'JetBrains.Toolbox',
	'JetBrains.Rider',
	'Microsoft.VisualStudio.2022.Enterprise',
	'Microsoft.SQLServer.2022.Developer',
	'Microsoft.SQLServerManagementStudio'
	#'Microsoft.AzureDataStudio'
)

# $paidTools = @(
# 	#office365proplus ` (TODO)
# 	#'TechSmith.Snagit',
# 	#'Microsoft.VisualStudio.2022.Enterprise',
# )

$otherTools = @(
	'Logitech.Options',
	'Microsoft.Teams'
	#paint.net (TODO)
	#'Bitwarden.Bitwarden',
	#'elvirbrk.notehighlight2016'
)

# Winget comes pre-installed on windows 11
# https://learn.microsoft.com/en-us/windows/package-manager/winget/
function WingetInstall([string]$tool){
	& winget install --id $tool --source winget --silent --accept-package-agreements --accept-source-agreements
}

if ($installMinimal.ToLower() -eq 'y') {
	Write-Host "➡️ Installing minimal setup"

	Foreach ($tool in $minimalTools) {
		WingetInstall($tool)
	}

	# install choco
	Write-Host "Installing/Updating Choco"
	if ($null -eq (Get-Command -Name choco.exe -ErrorAction SilentlyContinue)) {
		Set-ExecutionPolicy Bypass -Scope Process -Force
		[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
		Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	} else {
		& choco update Chocolatey
	}

	Write-Host "➡️ Installing fonts"
	# NOTE: Fonts cannot currently be installed via winget
	& choco install `
		cascadia-code-nerd-font `
		firacode `
		firacodenf `
		-y
}
else {
	Write-Host "⏭ Skipping minimal setup"
}

if ($installDev.ToLower() -eq 'y') {
	Write-Host "➡️ Installing dev tools"

	Foreach ($tool in $devTools) {
		WingetInstall($tool)
	}

	Write-Host "➡️ Installing WSL2 Ubuntu"
	& wsl --install -d Ubuntu
}
else {
	Write-Host "⏭ Skipping dev tools"
}

# if ($installPaid.ToLower() -eq 'y') {
# 	Write-Host "➡️ Installing paid tools"

# 	Foreach ($tool in $paidTools) {
#		WingetInstall($tool)
# 	}
# }
# else {
# 	Write-Host "⏭ Skipping paid tools"
# }

if ($installOther.ToLower() -eq 'y') {
	Write-Host "➡️ Installing other tools"

	Foreach ($tool in $otherTools) {
		WingetInstall($tool)
	}
}
else {
	Write-Host "⏭ Skipping other tools"
}

Write-Host "✅ Tool setup complete"
