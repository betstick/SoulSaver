# SoulSaver

## Description:
SoulSaver is a PowerShell script to automatically make backups of your FromSoftware game saves. It runs
in the background and backs up the saves of any running games at a defined interval (default 10 minutes).
It currently supports the following games:

- Dark Souls: Prepare to Die Edition*
- Dark souls: Remastered
- Dark souls II
- Dark souls II: Scholar of the First Sin
- Dark souls III
- Sekiro
- Elden Ring

*GFWL version is not supported, but if you're using Steam, it should automatically update to the Steam
version of the game. The Steam version is supported.

Pirated copies are *not* supported and will not work.

The backups are stored in the same location as the original saves. They also contain the date and
time they were created. To restore a backup, simply rename the file backup file to whatever the name
of the original file is.

## Install:
Run the included `Register.ps1` script by double clicking on it. Do not run it as administrator!

## Uninstall:
Run the included `Remove.ps1` script while logged into the account you installed it to. Alternatively
you can delete the scheduled task called `SoulSaver` and delete the files from `%AppData%\SoulSaver\`.

## Notes:
BACKUP YOUR GAME FILES BEFORE USING THIS PROGRAM JUST IN CASE!

You can customize the time by changing the last line of `Task.ps1` where it says `Start-Sleep -Seconds 600`.

This tool runs as a scheduled task that begins at login. Upon logging in, you will breifly see a blue
window open and close. I can't fix this for now. See: https://github.com/PowerShell/PowerShell/issues/3028
for more information.

## Issues:
If you have issues, you can submit an issue to this repo though I might not see it for a little while. You
can also @ me on ?ServerName? if you want.
