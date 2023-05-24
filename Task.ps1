while($true)
{
    $ptde  = Get-Process -Name "DARKSOULS" -ErrorAction SilentlyContinue
    $dsr   = Get-Process -Name "DarkSoulsRemastered" -ErrorAction SilentlyContinue
    $ds2   = Get-Process -Name "DarkSoulsII" -ErrorAction SilentlyContinue
    $sotfs = Get-Process -Name "DarkSoulsII" -ErrorAction SilentlyContinue
    $ds3   = Get-Process -Name "DarkSoulsIII" -ErrorAction SilentlyContinue

    $sek   = Get-Process -Name "sekiro" -ErrorAction SilentlyContinue

    $er    = Get-Process -Name "eldenring" -ErrorAction SilentlyContinue

    $bb    = Get-Process -Name "Bloodborne" -ErrorAction SilentlyContinue

    function Get-LastTouched
    {
	    param([String]$Path,[String]$Extension)
	
	    Get-ChildItem -Path $Path -File -Depth 4 -Include $Extension | Sort-Object -Descending -Property LastWriteTime | Select-Object -First 1
    }

    function New-Backup
    {
	    param([String]$Path,[String]$Extension)
	
	    $file = Get-LastTouched -Path $path -Extension $Extension

	    if($file)
	    {
		    $time = Get-Date -Format "yyyy-MM-dd_HH-mm"
		    $new_name = ($file.FullName).Replace($Extension,$Extension.Replace(".","_")) + "_" + $time + ".bak"
		    Copy-Item -Path $file.FullName -Destination $new_name
	    }
    }

    if($ptde)
    {
	    New-Backup -Path "$HOME\Documents\NBGI\DarkSouls\" -Extension "*.sl2"
    }

    if($dsr)
    {
	    New-Backup -Path "$HOME\Documents\NBGI\DARK SOULS REMASTERED\" -Extension "*.sl2"
    }

    if($ds2)
    {
	    New-Backup -Path "$env:APPDATA\DarkSoulsII\" -Extension "*.sl2"
    }

    if($sotfs)
    {
	    New-Backup -Path "$env:APPDATA\DarkSoulsII\" -Extension "*.sl2"
    }

    if($ds3)
    {
	    New-Backup -Path "$env:APPDATA\DarkSoulsIII\" -Extension "*.sl2"
    }

    if($sek)
    {
	    New-Backup -Path "$env:APPDATA\Sekiro\" -Extension "*.sl2"
    }

    if($er)
    {
	    New-Backup -Path "$env:APPDATA\EldenRing\" -Extension "*.sl2"
    }

    if($bb)
    {
	    New-Backup -Path "$env:APPDATA\Bloodborne\" -Extension "*.sl2"
    }

    Start-Sleep -Seconds 600
}
