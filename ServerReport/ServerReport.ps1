# Retrieves System Info
$Name = $env:COMPUTERNAME
$Version = (get-computerInfo | Select-Object OsVersion).osversion
$DiskCount = (Get-CimInstance CIM_LogicalDisk).Count
$FreeSpace = (Get-CimInstance CIM_LogicalDisk).FreeSpace
$MAC = (Get-NetAdapter).MacAddress
$Mem = (Get-WMIObject Win32_OperatingSystem).TotalVisibleMemorySize

#Make Our own custom object
$obj = [PSCustomObject]@{
    ComputerName = $Name
    OSVersion = $Version
    DiskCount = $DiskCount
    "GB Free" = $FreeSpace 
    MAC = $MAC
    Memory = $Mem
}

#Show Output
Write-Output $obj
