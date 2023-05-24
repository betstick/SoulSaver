$name = "SoulSaver"
$desc = "FromSoftware save file backup utility created by betstick"
$path = "$env:APPDATA\$name"
$script = ($MyInvocation.MyCommand.Path).Replace("Register.ps1","Task.ps1")
#$time = [int](Read-Host -Prompt "Input backup frequency in minutes")

#get rid of existing tasks to avoid duplication
$exists = Get-ScheduledTask -TaskName $name -ErrorAction SilentlyContinue
if($exists)
{
    Write-Output "Found existing task, removing it..."
    Stop-ScheduledTask -TaskName $name
    Unregister-ScheduledTask -TaskName $name -Confirm:$false
    Remove-Item -Path $path -Recurse -Confirm:$false
}

if(-not (Test-Path -Path $script))
{
    throw 'Failed to find Task.ps1!'
}

if(Test-Path -Path $path)
{
    Remove-Item -Path $path -Recurse -Confirm:$false -ErrorAction SilentlyContinue
}

New-Item $path -ItemType Directory
Copy-Item -Path $script

$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -WorkingDirectory $HOME `
    -Argument "-WindowStyle Hidden -File `"$script`""
$trigger = New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -DontStopOnIdleEnd
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $name -Description $desc -Settings $settings

Start-ScheduledTask -TaskName $name
