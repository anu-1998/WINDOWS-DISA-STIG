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
    STIG-ID         : WN11-CC-000035

.TESTED ON
    Date(s) Tested  : 2026-02-04
    Tested By       : Anaswara Raj
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run this script as Administrator.
    Example syntax:
    PS C:\> .\remediation_WN11-CC-000035.ps1
#>

# STIG ID: WN11-CC-000035
# Description: Set Minimum Password Length to 14 characters



Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "MinimumPasswordLength" -Value 14 -Type DWord -Force; gpupdate /force
