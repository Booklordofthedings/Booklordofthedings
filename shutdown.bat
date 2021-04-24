@echo off 
    setlocal enableextensions disabledelayedexpansion

    set "search=current status: Online"
    set "replace=current status: Offline"
	
    set "textFile=README.md"

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%textFile%" echo(!line:%search%=%replace%!
        endlocal
		
    )

	git add .
	git commit -m "changing status"
	git push
