$staging = "c:\staging\"
New-Item -Path $staging -ItemType Directory
$destination = "c:\triage_image.zip"

$paths = Get-ChildItem -Path $env:SYSTEMROOT\System32\winevt\Logs\
$paths += Get-ChildItem -Path $env:SYSTEMROOT\System32\config\
$paths += Get-item -Path $env:SYSTEMROOT\AppCompat\Programs\Amcache.hve  
$paths += Get-item -Path $env:SYSTEMROOT\System32\sru\SRUDB.dat
$paths += Get-ChildItem -Path $env:userprofile\ -include ntuser.dat*
$paths += Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows -include userclass.dat*
$paths += Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows\Explorer -include thumbcache*
$paths += Get-ChildItem -Path $env:userprofile\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
$paths += Get-ChildItem -Path $env:userprofile\AppData\Roaming\Microsoft\Windows\Recent\
$paths += Get-ChildItem -Path $env:userprofile\AppData\Roaming\Microsoft\Office\Recent\  
$paths += Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows\WebCache\
$paths += Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows\Explorer\
$paths += Get-ChildItem -Path $env:userprofile\AppData\Local\ConnectedDevicesPlatform\
$paths += Get-ChildItem -Path $env:userprofile\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations
$paths += Get-ChildItem -Path $env:userprofile\Appdata\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
$paths += Get-ChildItem -Path $env:userprofile\AppData\Local\Microsoft\Windows\ -include UsrClass.dat*


ForEach ($Path in $paths ) 
{
    if (Test-Path $Path.FullName) {
        robocopy $Path.DirectoryName $staging $Path.Name
    }
}

Get-ChildItem -Path $staging -Recurse | Compress-Archive -DestinationPath $destination -Force -ErrorAction Continue
Remove-Item -Path $staging -Recurse -Force