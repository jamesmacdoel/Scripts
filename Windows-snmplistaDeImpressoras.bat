:: using snmpget from https://ezfive.com/snmpsoft-tools/snmp-get/
@echo off
setlocal enableDelayedExpansion

set IPs[0]=192.168.6.22
set IPs[1]=192.168.6.14
set IPs[2]=192.168.6.15

set /a start=0, stop=0

:arrayLength
if defined IPs[%stop%] (
  set /a stop+=1
  goto arrayLength
)
if %stop% gtr 0 set /a stop-=1


for /L %%n in (%start%,1,%stop%) do (
  echo IP: !IPs[%%n]!
  .\SnmpGet.exe -v:1 -c:public -r:!IPs[%%n]! -o:1.3.6.1.2.1.43.10.2.1.4.1.1 |findstr Value
  echo.
)

pause