# Script to extract DeviceHash for importing into Autopilot
# This is a dirty way until we do bulk importing
# Grant: 24/05/2021
# Dan: 09/06/2021
$serial=$(get-wmiobject win32_bios).SerialNumber

$cabpath="c:\windows\temp\$serial.cab"
#Need to save locally before copying to a remote location
start-process "c:\windows\system32\MdmDiagnosticsTool.exe" -arg "-area Autopilot;DeviceProvisioning -cab $cabpath" -wait


if(test-path($cabpath))     {
    try { cmd.exe /c "C:\Windows\System32\expand.exe -F:devicehash* $cabpath C:\windows\temp"}
   catch { Write-host "Cab not found"}
}


copy-item "C:\windows\temp\DeviceHash_$($env:computername).csv" "D:\DeviceHash_$($env:computername)-$serial.csv"