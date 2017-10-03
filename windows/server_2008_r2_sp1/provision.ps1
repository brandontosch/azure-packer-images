(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu', './Windows6.1-KB2506143-x64.msu')

$arglist='Windows6.1-KB2506143-x64.msu','/quiet','/norestart'
Start-Process -FilePath 'c:\windows\system32\wusa.exe' -ArgumentList $arglist -NoNewWindow -Wait

if( Test-Path $Env:SystemRoot\windows\system32\Sysprep\unattend.xml ) {
    Remove-Item $Env:SystemRoot\windows\system32\Sysprep\unattend.xml -Force
}

& $Env:SystemRoot\System32\Sysprep\Sysprep.exe /oobe /generalize /shutdown /quiet