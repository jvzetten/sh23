#Define global variables
$DNSName = "ZZicht.local"
$DNSServers = "10.10.0.11","8.8.8.8"
$SubnetMask = "255.255.255.0"
$LeaseDuration = (New-TimeSpan -Days 8).TotalSeconds

# Define variables for the medewerkers scope
$MedewerkersScope = "Zzicht_Medewerkers"
$MedewerkersStart = "10.10.1.20"
$MedewerkersEnd = "10.10.1.100"
$MedewerkersRouter = "10.10.1.1"
$MedewerkersScopeID = "10.10.1.0"

# Define variables for the medewerkers scope
$GastenScope = "Zzicht_Gasten"
$GastenStart = "10.10.2.20"
$GastenEnd = "10.10.2.100"
$GastenRouter = "10.10.2.1"
$GastenScopeID = "10.10.2.0"
$GastenDNSName = "ZZicht.gast"
$GastenDNSServers = "8.8.8.8","1.1.1.1"

# Add the new DHCPv4 Medewerkers-scope
Add-DhcpServerv4Scope -Name $MedewerkersScope -StartRange $MedewerkersStart -EndRange $MedewerkersEnd -SubnetMask $SubnetMask -State Active -LeaseDuration $LeaseDuration

# Set the router option for the new Medewerkers-scope
Set-DhcpServerv4OptionValue -OptionId 3 -ScopeId $MedewerkersScopeID -Value $MedewerkersRouter

# Set the DNS name option for the new Medewerkers-scope
Set-DhcpServerv4OptionValue -OptionId 15 -ScopeId $MedewerkersScopeID -Value $DNSName

# Set the DNS server option for the new Medewerkers-scope
Set-DhcpServerv4OptionValue -OptionId 6 -ScopeId $MedewerkersScopeID -Value $DNSServers -Force


# Add the new DHCPv4 Gasten-scope
Add-DhcpServerv4Scope -Name $GastenScope -StartRange $GastenStart -EndRange $GastenEnd -SubnetMask $SubnetMask -State Active -LeaseDuration $LeaseDuration

# Set the router option for the new Gasten-scope
Set-DhcpServerv4OptionValue -OptionId 3 -ScopeId $GastenScopeID -Value $GastenRouter

# Set the DNS name option for the new Gasten-scope
Set-DhcpServerv4OptionValue -OptionId 15 -ScopeId $GastenScopeID -Value $GastenDNSName

# Set the DNS server option for the new Gasten-scope
Set-DhcpServerv4OptionValue -OptionId 6 -ScopeId $GastenScopeID -Value $GastenDNSServers -Force
