# Retrieves System Name
$Name = $env:COMPUTERNAME

# OS version info
$Version = (get-computerInfo | Select-Object OsVersion).osversion

# Logical Disk Count
$DiskCount = (Get-CimInstance CIM_LogicalDisk).Count