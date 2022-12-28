# Run before the script: Set-ExecutionPolicy Bypass -Scope Process -Force;
# Run the script in Admin Mode

# Chocolatey Setup
System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

# Chocolatey Installations
    # Moved all choco installs to winget

# Importing modules
Import-Module .\functionsModule.psm1

# Winget Installations
winget upgrade --all # Upgrade installed programs

         
$programs = "Brave.Brave",
            "Discord.Discord",
            "VideoLAN.VLC",
            "OBSProject.OBSStudio",
            "Microsoft.WindowsTerminal",
            "Microsoft.VisualStudioCode",
            "Microsoft.Teams",
            "Notepad++.Notepad++",
            "Flameshot.Flameshot",
            "7zip.7zip",
            "9WZDNCRFHWLH",          # HP Smart (from MS Store)
            "9NKSQGP7F2NH",          # WhatsApp (from MS Store)
            "9NCBCSZSJRSB",          # Spotify (from MS Store)
            "Microsoft.PowerShell",
            "JanDeDobbeleer.OhMyPosh",
            "GitExtensionsTeam.GitExtensions",
            "KDE.KDiff3",
            "Logitech.LGS";

foreach ($program in $programs){
    winget install -e --id $program;
}


winget upgrade --all # Upgrade dependencies from the new programs

winget install -e "Git.Git" --version "2.33.0.2" # Install git in a specified version
Install-DraculaNotepadpp
