<#
.SYNOPSIS
    This PowerShell script ensures that the Windows Installer feature 
    "Always install with elevated privileges" is disabled.

.NOTES
    Author          : Anaswara Raj
    LinkedIn        : 
    GitHub          :
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

# Registry paths
$path1 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$path2 = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Installer"

# Create registry keys if they do not exist
New-Item -Path $path1 -Force | Out-Null
New-Item -Path $path2 -Force | Out-Null

# Set the policy to Disabled (0)
Set-ItemProperty -Path $path1 -Name "AlwaysInstallElevated" -Value 0
Set-ItemProperty -Path $path2 -Name "AlwaysInstallElevated" -Value 0

Write-Host "STIG WN11-CC-000315 applied: Always install with elevated privileges is disabled."
