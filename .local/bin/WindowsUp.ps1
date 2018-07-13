Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Determine if we are running as admin
$wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$prp = [System.Security.Principal.WindowsPrincipal]::new($wid)
$adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
$isAdmin = $prp.IsInRole($adm)

if(-not $isAdmin) {
   Write-Error "Please run from an elevated prompt."
   return
}

# Loosen the execution policy to make PowerShell generally usable
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Install software packages
Invoke-RestMethod https://chocolatey.org/install.ps1 | Invoke-Expression
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"
choco install -y git nodejs.install ripgrep autohotkey.install googlechrome slack hunspell.portable ccleaner ditto sql-server-management-studio python3 fzf
Update-SessionEnvironment
