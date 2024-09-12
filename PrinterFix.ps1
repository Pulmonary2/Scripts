net stop spooler
sc failure spooler actions= restart/60000/restart/60000// reset= 240
sc config spooler depend= RPCSS
taskkill.exe /f /im printfilterpipelinesrv.exe
del %windir%\system32\spool\printers\*.* /q
del %windir%\system32\spool\servers\*.* /q
# (DANGEROUS) Uncomment to re-install all printers (DANGEROUS)
#del C:\Temp\*.bak /q
#reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Print Processors\winprint" "C:\Temp\64print.bak"
#reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows NT x86\Print Processors\winprint" "C:\Temp\32print.bak"
#reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Print Processors" /va /f
#reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows NT x86\Print Processors" /va /f
#reg import "C:\Temp\64print.bak"
#reg import "C:\Temp\32print.bak"
net start spooler
