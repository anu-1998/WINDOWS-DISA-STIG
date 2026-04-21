


Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "MinimumPasswordLength" -Value 14 -Type DWord -Force; gpupdate /force
