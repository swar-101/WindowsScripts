# ========================================
# Windows Security Automation Script
# ========================================


# 1. Disable the Guest Account
# Using Get-LocalUser if available (requires PowerShell 5+ on Windows 10/11)

try {
	$guest = Get-LocalUser -Name "Guest" -ErrorAction Stop 
	if ($guest.Enabled) {
		Disable-LocalUser -Name "Guest" 
		Write-Output "Guest account has been disabled."
	} else {
		Write-Ouput "Guest account is already disabled."
	}
} catch {
	Write-Output "Could not find or disable the Guest account. It may be already unavailable or disabled on your edition."
}

# 2. Create Firewll Rules to Block Vulnerable Ports

# Block SMB: TCP Port 445 
New-NetFirewallRule -DisplayName "Block SMB (TCP 445)" -Direction Inbound -LocalPort 445 -Protocol TCP -Action Block -Profile Any -ErrorAction SilentlyContinue

# Block SMB: TCP Port 139 
New-NetFirewallRule -DisplayName "Block SMB (TCP 139)" -Direction Inbound -LocalPort 139 -Protocol TCP -Action Block -Profile Any -ErrorAction SilentlyContinue

# Block RDP: TCP Port 3389 (If RDP is not in use) 
New-NetFirewallRule -DisplayName "Block RDP (TCP 3389)" -Direction Inbound -LocalPort 3389 -Protocol TCP -Action Block -Profile Any -ErrorAction SilentlyContinue

Write-Ouput "Firewall rules have been configured."

# 3. Disable Remote Desktop via Registry

$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server"
Set-ItemProperty -Path $registryPath -Name "fDenyTSConnections" -Value 1 -ErrorAction SilentlyContinue

Write-Output "Remote Desktop has been disabled via the resgistry."


# 4. (Optional) Additional Recommendations
# You might also consider disabling administrative shares or enabling BitLocker.
# but those require more in-depth handling and administrative oversight.
# For administrative shares, you'd typically modify: 
# HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\AutoShareWks
# and set it to 0. 
# BitLocker can be automated with the Manage-bde command if needed.

Write-Output "Windows security automation script completed."


