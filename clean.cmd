@cd /d %~dp0
@for /F "usebackq tokens=1,2* delims==" %%I in ( `findstr /V /B # project.properties` ) do @set %%I=%%J
@if not defined docker exit 1
%docker% rm -f %container_name% 2>nul
