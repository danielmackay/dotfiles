# Dotfiles and scripts I use on dev machines

> Based off https://github.com/wicksipedia/dotfiles

## Setup

You'll need the latest version of winget. This can be updated via the Microsoft Store.

1. Install the tools

   ```bash
   iwr -useb https://raw.githubusercontent.com/danielmackay/dotfiles/main/setup-tools.ps1 | iex
   ```

2. Clone repo

   ```bash
   git clone https://github.com/danielmackay/dotfiles.git
   ```

3. Customise Powershell & Windows Terminal

   ```bash
   .\setup-shell.ps1
   ```

4. Reload profile

   ```bash
   . $profile
   ```

## Update

1. Pull latest

   ```bash
   git pull
   ```

2. Reinstall the tools

   ```bash
   .\setup-tools.ps1
   ```

3. Customise Powershell & Windows Terminal

   ```bash
   .\setup-shell.ps1
   ```

4. Reload profile

   ```bash
   . $profile
   ```

## What does this add?

If you don't want to install a particular item - feel free to comment the line out in the setup-choco script

Installs:

Minimal tools:

- Git
- oh-my-posh
- Powershell Core
- VSCode
- Working Hours (Time Tracker)
- Flameshot (screenshots)

Dev tools:

- Azure CLI
- Docker
- GitHub CLI
- Insomnia
- Nodejs LTS
- NVM
- Beyond Compare 4
- JetBrains Toolbox
- JetBrains Rider
- Visual Studio 2022
- SQL Server Developer 2022
- SQL Server Management Studio
- .NET 8 SDK
- Nuget CLI

Other tools:

- Microsoft Teams
- Logitech Options
- Logitech GHUB
- Notion
- WhatsApp
- Philips Hue Sync

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
