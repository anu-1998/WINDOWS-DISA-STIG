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
# Disable Windows Installer elevated privilege


# Import the GroupPolicy module
Import-Module GroupPolicy

# Set the policy to Disabled in the Local Computer Policy
Set-GPRegistryValue -Name "Local Computer Policy" `
    -Key "HKLM\Software\Policies\Microsoft\Windows\Installer" `
    -ValueName "AlwaysInstallElevated" `
    -Type DWord `
    -Value 0

# Refresh policies
gpupdate /force

# ✅ Key Point
#Even if gpedit.msc says “Not Configured”, if the registry values are set correctly, your system complies with the STIG:


# Check if AlwaysInstallElevated is disabled
Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name AlwaysInstallElevated
Get-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Installer" -Name AlwaysInstallElevated



