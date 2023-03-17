# Define variables for the new scope
$ScopeName = "Zzicht_scope"
$ScopeStart = "10.10.0.20"
$ScopeEnd = "10.10.0.100"
$ScopeMask = "255.255.255.0"
$Router = "10.10.0.1"
$DNSName = "ZZicht.local"
$DNSServers = "10.10.0.11","8.8.8.8"
$LeaseDuration = (New-TimeSpan -Days 8).TotalSeconds

# Add the new DHCPv4 scope
Add-DhcpServerv4Scope -Name $ScopeName -StartRange $ScopeStart -EndRange $ScopeEnd -SubnetMask $ScopeMask -State Active -LeaseDuration $LeaseDuration

# Set the router option for the new scope
Set-DhcpServerv4OptionValue -OptionId 3 -ScopeId $ScopeName -Value $Router

# Set the DNS name option for the new scope
Set-DhcpServerv4OptionValue -OptionId 15 -ScopeId $ScopeName -Value $DNSName

# Set the DNS server option for the new scope
Set-DhcpServerv4OptionValue -OptionId 6 -ScopeId $ScopeName -Value $DNSServers
