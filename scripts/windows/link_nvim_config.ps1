# link NeoVim configuration
echo "link NeoVim config"
$dotFilesRoot = Join-Path $HOME ".dotfiles"
$dotfilesConfiguration = $dotFilesRoot | Join-Path -ChildPath "nvim/.config/nvim"
$localConfiguration = Join-Path $env:LOCALAPPDATA "nvim"

echo "dotFilesRoot: $dotFilesRoot"
echo "dotfilesConfiguration: $dotfilesConfiguration"
echo "localConfiguration: $localConfiguration"


if (!(Test-Path $localConfiguration -PathType Container)) { 
	echo "linking ..."
    Start-Process -FilePath "powershell" -ArgumentList "-c New-Item -Path $localConfiguration -ItemType SymbolicLink -Value $dotfilesConfiguration".Split(" ") -Verb runas
}
echo "done"
