# Dotfiles and scripts I use on dev machines

> Based off https://github.com/wicksipedia/dotfiles

## Setup

1. Install the tools
   `iwr -useb https://raw.githubusercontent.com/danielmackay/dotfiles/main/setup-tools.ps1 | iex`
2. Clone repo
   `git clone https://github.com/danielmackay/dotfiles.git`
3. Customise Powershell & Windows Terminal
   `.\setup-shell.ps1`
4. Reload profile
   `. $profile`

## Update

1. Pull latest
   `git pull`
2. Reinstall the tools
   `.\setup-tools.ps1`
3. Customise Powershell & Windows Terminal
   `.\setup-shell.ps1`
4. Reload profile
   `. $profile`

## What does this add?

If you don't want to install a particular item - feel free to comment the line out in the setup-choco script

Installs:

Free tools:

- 7zip
- Azure CLI
- Docker
- Git
- GitHub CLI
- Insomnia
- oh-my-posh
- Linqpad
- Logitech Options
- Microsoft Teams
- Nodejs LTS
- Notepad++
- NSwag studio
- Postman
- Powershell 7
- VSCode

Paid tools: (optional)

- Office365 ProPlus
- Snagit
- Visual Studio 2019 Enterprise

Customisations:

- Terminal-Icons
- Git
  - Aliases
- Powershell
  - Aliases
  - Hotkeys/Chords

## Troubleshooting

if you are not able to run powershell scripts you may need to adjust your execution policy

```ps1
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```

And then set this back via:

```ps1
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser
```

## Want more? Need somthing else?

This is a WIP - Happy to take suggestions! Submit an issue/PR!
