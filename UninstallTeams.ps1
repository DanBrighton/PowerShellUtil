$Profile = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*" | Where-Object {$_.Guid -eq "{271366b7-bb5c-4625-943e-fa513bb0caba}"}
$ProfileFolder = $Profile.ProfileImagePath

IF (Test-Path "$ProfileFolder\AppData\Local\Microsoft\Teams\Update.exe") 
{
	Start-Process -FilePath "$ProfileFolder\AppData\Local\Microsoft\Teams\Update.exe" -ArgumentList "--uninstall /s"
	Remove-Item -Path "$ProfileFolder\AppData\Local\Microsoft\Teams\" -Recurse
	
}