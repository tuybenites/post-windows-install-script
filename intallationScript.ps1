# Run before script: Set-ExecutionPolicy Bypass -Scope Process -Force;

# Chocolatey Setup
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

# Chocolatey Installations
    # Moved all choco installs to winget

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
            "GitExtensionsTeam.GitExtensions"

foreach ($program in $programs){
    winget install -e --id $program;
}


winget upgrade --all # Upgrade dependencies from the new programs

winget install "Git.Git" --version "2.33.0.2" # Install git in a specified version
# Installing notepad++ dracula theme
git clone "https://github.com/dracula/notepad-plus-plus.git" "$HOME\Downloads\notepadpp"; 
Move-Item -Path "$HOME\Downloads\notepadpp\Dracula.xml" -Destination "C:\Program Files\Notepad++\themes"
Remove-Item -Path "$HOME\Downloads\notepadpp\" -force
