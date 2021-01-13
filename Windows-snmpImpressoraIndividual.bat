:: using snmpget from https://ezfive.com/snmpsoft-tools/snmp-get/
@echo off

:while
SET /p ip=IP da impressora: 
if %ip%=="" (goto end) else (
  .\SnmpGet.exe -v:1 -c:public -r:%ip% -o:1.3.6.1.2.1.43.10.2.1.4.1.1 |findstr Value
  echo.
  SET ip=
  goto while
)

:end
exit