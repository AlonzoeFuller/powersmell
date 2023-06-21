# Retrieves System Name
$Name = Env:COMPUTERNAME

# OS version info
($Version = get-computerInfo | Select-Object OsVersion).osversion
