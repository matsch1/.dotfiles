# link NeoVim configuration
echo "link NeoVim config"
$dotFilesRoot = Join-Path $HOME ".dotfiles"
$dotfilesConfiguration = Join-Path $dotFilesRoot "nvim" ".config" "nvim"
$localConfiguration = Join-Path $env:LOCALAPPDATA "nvim"

echo "doftifleConfig: $dotfilesConfiguration"
echo "localConfig: $localConfiguration"


if (!(Test-Path $localConfiguration -PathType Container)) { 
	echo "linking ..."
    Start-Process -FilePath "pwsh" -ArgumentList "-c New-Item -Path $localConfiguration -ItemType SymbolicLink -Value $dotfilesConfiguration".Split(" ") -Verb runas
}
echo "done"