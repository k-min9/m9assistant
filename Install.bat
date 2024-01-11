@echo off

set CURL_CMD=C:\Windows\System32\curl.exe

REM main.exe가 현재 폴더에 이미 존재하는지 확인
if exist main.exe (
    echo main.exe already exist. skip downloading
) else (
    echo start downloading main.exe
    curl -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/main.exe?download=true --output main.exe

    if errorlevel 1 (
        echo main.exe download retry...
        %CURL_CMD% -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/main.exe?download=true --output main.exe
    )

    REM 최종적으로 다운로드 성공 여부 확인
    if errorlevel 1 (
        echo main.exe download failed
        pause
        exit /b 1
    )

    echo main.exe downloaded
)

pause
