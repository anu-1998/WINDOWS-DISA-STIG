<#
.SYNOPSIS
    This PowerShell script ensures that the Windows Installer feature 
    "Always install with elevated privileges" is disabled.

.NOTES
    Author          : Anaswara Raj
    LinkedIn        : https://www.linkedin.com/in/anaswara-raj/
    GitHub          : https://github.com/anu-1998
    Date Created    : 2026-02-01
    Last Modified   : 2026-02-03
    Version         : 1.1
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 2026-02-04
    Tested By       : Anaswara Raj
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run this script as Administrator.
    Example syntax:
    PS C:\> .\remediation_WN11-CC-000315.ps1
#>

# STIG ID: WN11-CC-000315
# Description: Disable Windows Installer elevated privileges for both machine and user

# Registry paths and value name
# STIG ID: WN11-CC-000315
# Disable Windows Installer elevated privileges

$paths = @(
    "HKLM:\Software\Policies\Microsoft\Windows\Installer",
    "HKCU:\Software\Policies\Microsoft\Windows\Installer"
)
$regName = "AlwaysInstallElevated"

foreach ($path in $paths) {
    # Create registry key if missing
    if (-not (Test-Path $path)) {
        New-Item -Path $path -Force | Out-Null
    }

    # Set the value to Disabled (0)
    New-ItemProperty -Path $path -Name $regName -PropertyType DWord -Value 0 -Force | Out-Null

    Write-Host "[$path] AlwaysInstallElevated set to 0 (Disabled)"
}

# Refresh Group Policy to enforce immediately
Write-Host "Refreshing Group Policy..."
gpupdate /force | Out-Null

Write-Host "WN11-CC-000315 remediation applied successfully."

