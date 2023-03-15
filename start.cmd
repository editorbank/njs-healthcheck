@cd /d %~dp0
@for /F "usebackq tokens=1,2* delims==" %%I in ( `findstr /V /B # project.properties` ) do @set %%I=%%J
@if not defined docker exit 1

%docker% rm -f %container_name%
%docker% run -d --name %container_name% ^
  -v %CD%\src\nginx.conf:/etc/nginx/nginx.conf ^
  -v %CD%\src\http.js:/etc/nginx/http.js ^
  -p 1161 ^
  %image_name%

@for /F "usebackq tokens=2 delims=:" %%I in ( `%docker% port %container_name%` ) do set container_port=%%I
if defined container_port curl -D- localhost:%container_port%
