# Retrieves System Info
$Name = $env:COMPUTERNAME
$Version = (get-computerInfo | Select-Object OsVersion).osversion
$DiskCount = (Get-CimInstance CIM_LogicalDisk).Count
$FreeSpace = (Get-CimInstance CIM_LogicalDisk).FreeSpace
$MAC = (Get-NetAdapter).MacAddress
$Mem = (Get-WMIObject Win32_OperatingSystem).TotalVisibleMemorySize
$IP4 = (Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.status -ne "Disconnected"}).IPv4Address.IPAddress

#Make Our own custom object
$obj = [PSCustomObject]@{
    ComputerName = $Name
    OSVersion = $Version
    DiskCount = $DiskCount
    "Disk Space Free" = $FreeSpace 
    MAC = $MAC
    Memory = $Mem
    "Ip Address (V4)" = $IP4
}

#Show Output
Write-Output $obj
