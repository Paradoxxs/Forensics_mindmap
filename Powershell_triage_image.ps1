
$paths = Get-ChildItem -Path $env:SYSTEMROOT\System32\winevt\Logs\
$paths = Get-ChildItem -Path $env:SYSTEMROOT\System32\winevt\config\
$paths = Get-item -Path $env:SYSTEMROOT\AppCompat\Programs\Amcache.hve  
$paths = Get-item -Path $env:SYSTEMROOT\System32\SRUDB.dat
$paths = Get-ChildItem -Path $env:userprofile\ -include ntuser.dat*
$paths = Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows -include userclass.dat*
$paths = Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows\Explorer -include thumbcache*
$paths = Get-ChildItem -Path $env:userprofile\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
$paths = Get-ChildItem -Path $env:userprofile\AppData\Roaming\Mozilla\Firefox\Profiles\
$paths = Get-ChildItem -Path $env:userprofile\AppData\Roaming\Microsoft\Windows\Recent\
$paths = Get-ChildItem -Path $env:userprofile\AppData\Roaming\Microsoft\Office\Recent\  
$paths = Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows\WebCache\
$paths = Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows\Explorer\
$paths = Get-ChildItem -Path $env:userprofile\AppData\Local\ConnectedDevicesPlatform\
$paths = Get-ChildItem -Path $env:userprofile\AppData\Local\Google\Chrome\User Data\Default\History\
$paths = Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Edge\User Data\Default\History\
$paths = Get-ChildItem -Path $env:userprofile\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations
$paths = Get-ChildItem -Path $env:userprofile\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
$paths = Get-item -Path $env:userprofile\AppData\Local\ConnectedDevices  Platform\ActivitiesCache.db  
$paths = Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows\ -include UsrClass.dat*
$paths = Get-ChildItem -Path $env:programdata\Microsoft\Windows\Start Menu\Programs\Startup\
$paths = Get-item -Path $env:programdata\microsoft\search\data\application\windows\windows.edb

ForEach ($Path in $paths) 
{

Get-ChildItem $path.fullname -Recurse |foreach{

Compress-Archive -Path $_.FullName -DestinationPath "C:\$($path.name).zip" -update -CompressionLevel Optimal

 }
}
