@echo off 
    setlocal enableextensions disabledelayedexpansion

    set "search=current status: Offline"
    set "replace=current status: Online"
	
    set "textFile=README.md"

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%textFile%" echo(!line:%search%=%replace%!
		if "%line%" == "%search%" goto out
        endlocal
		
    )
	:out
	endlocal
	git add .
	git commit -m "changing status"
	git push
