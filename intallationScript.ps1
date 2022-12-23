# Run before script: Set-ExecutionPolicy Bypass -Scope Process -Force;

# Chocolatey Setup
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

# Chocolatey Installations
    # Moved all choco installs to winget

# Winget Installations
winget upgrade --all # Upgrade installed programs

winget install -e --id Brave.Brave
winget install -e --id Discord.Discord;
winget install -e --id VideoLAN.VLC;
winget install -e --id OBSProject.OBSStudio;
winget install -e --id Microsoft.WindowsTerminal;
winget install -e --id Microsoft.VisualStudioCode;
winget install -e --id Microsoft.Teams;
winget install -e --id "Notepad++.Notepad++";
winget install -e --id Flameshot.Flameshot;
winget install -e --id "7zip.7zip";
winget install -e --id "9WZDNCRFHWLH"; # HP Smart (from MS Store)
winget install -e --id "9NKSQGP7F2NH"; # WhatsApp (from MS Store)
winget install -e --id "9NCBCSZSJRSB"; # Spotify (from MS Store)
winget install -e --id Microsoft.PowerShell;
winget install -e --id JanDeDobbeleer.OhMyPosh;

winget upgrade --all # Upgrade dependencies from the new programs

# Remove Windows icon arrow
$REGEDIT_PATH = "Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons\";
New-Item -Path $REGEDIT_PATH;
New-ItemProperty -Path $REGEDIT_PATH -Name "29" -Value "%windir%\System32\shell32.dll,-50" -PropertyType String

set-alias edit "C:\Program Files\Notepad++\notepad++.exe" # To open notepadpp from terminal