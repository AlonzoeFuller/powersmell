# Retrieves System Info
$Name = $env:COMPUTERNAME
$Version = (get-computerInfo | Select-Object OsVersion).osversion
$DiskCount = (Get-CimInstance CIM_LogicalDisk).Count
$FreeSpace = (Get-CimInstance CIM_LogicalDisk).FreeSpace

#Make Our own custom object
$obj = [PSCustomObject]@{
    ComputerName = $Name
    DiskCount = $DiskCount
    OSVersion = $Version
    "GB Free" = $FreeSpace / 1Gb
}

#Show Output
Write-Output $obj
