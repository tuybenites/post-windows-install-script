function Install-DraculaNotepadpp {
    git clone "https://github.com/dracula/notepad-plus-plus.git" "$HOME\Downloads\notepadpp"; 
    Move-Item -Path "$HOME\Downloads\notepadpp\Dracula.xml" -Destination "C:\Program Files\Notepad++\themes"
    Remove-Item -Path "$HOME\Downloads\notepadpp\" -force -Recurse
}

Export-ModuleMember -Function Install-DraculaNotepadpp