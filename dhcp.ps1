#Define global variables
$DNSName = "ZZicht.local"
$DNSServers = "10.10.0.11","8.8.8.8"
$SubnetMask = "255.255.255.0"
$LeaseDuration = (New-TimeSpan -Days 8).TotalSeconds

# Define variables for the management scope
$MgmtScope = "Zzicht_Management"
$MgmtStart = "10.10.0.20"
$MgmtEnd = "10.10.0.100"
$MgmtRouter = "10.10.0.1"

# Define variables for the medewerkers scope
$MedewerkersScope = "Zzicht_Medewerkers"
$MedewerkersStart = "10.10.1.20"
$MedewerkersEnd = "10.10.1.100"
$MedewerkersRouter = "10.10.1.1"

# Define variables for the medewerkers scope
$GastenScope = "Zzicht_Gasten"
$GastenStart = "10.10.2.20"
$GastenEnd = "10.10.2.100"
$GastenRouter = "10.10.2.1"

# Add the new DHCPv4 mgmt-scope
Add-DhcpServerv4Scope -Name $MgmtScope -StartRange $MgmtStart -EndRange $MgmtEnd -SubnetMask $SubnetMask -State Active -LeaseDuration $LeaseDuration

# Set the router option for the new mgmt-scope
Set-DhcpServerv4OptionValue -OptionId 3 -ScopeId $MgmtScope -Value $MgmtRouter

# Set the DNS name option for the new mgmt-scope
Set-DhcpServerv4OptionValue -OptionId 15 -ScopeId $MgmtScope -Value $DNSName

# Set the DNS server option for the new mgmt-scope
Set-DhcpServerv4OptionValue -OptionId 6 -ScopeId $MgmtScope -Value $DNSServers


# Add the new DHCPv4 Medewerkers-scope
Add-DhcpServerv4Scope -Name $MedewerkersScope -StartRange $MedewerkersStart -EndRange $MedewerkersEnd -SubnetMask $SubnetMask -State Active -LeaseDuration $LeaseDuration

# Set the router option for the new Medewerkers-scope
Set-DhcpServerv4OptionValue -OptionId 3 -ScopeId $MedewerkersScope -Value $MedewerkersRouter

# Set the DNS name option for the new Medewerkers-scope
Set-DhcpServerv4OptionValue -OptionId 15 -ScopeId $MedewerkersScope -Value $DNSName

# Set the DNS server option for the new Medewerkers-scope
Set-DhcpServerv4OptionValue -OptionId 6 -ScopeId $MedewerkersScope -Value $DNSServers


# Add the new DHCPv4 Gasten-scope
Add-DhcpServerv4Scope -Name $GastenScope -StartRange $GastenStart -EndRange $GastenEnd -SubnetMask $SubnetMask -State Active -LeaseDuration $LeaseDuration

# Set the router option for the new Gasten-scope
Set-DhcpServerv4OptionValue -OptionId 3 -ScopeId $GastenScope -Value $GastenRouter

# Set the DNS name option for the new Gasten-scope
Set-DhcpServerv4OptionValue -OptionId 15 -ScopeId $GastenScope -Value $DNSName

# Set the DNS server option for the new Gasten-scope
Set-DhcpServerv4OptionValue -OptionId 6 -ScopeId $GastenScope -Value $DNSServers
