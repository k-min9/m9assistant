@echo off

pushd %~dp0
set CURL_CMD=C:\Windows\System32\curl.exe
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

REM main.exe
if exist main.exe (
    echo main.exe already exist. skip downloading
) else (
    echo start downloading main.exe
    curl -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/main.exe?download=true --output main.exe

    if %errorlevel% neq 0 (
        echo main.exe download retry...
        %CURL_CMD% -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/main.exe?download=true --output main.exe
    )
    echo main.exe download finished
)

REM make model_folder
if not exist data\ (
    mkdir data
)

REM models_config
if exist data\config.json (
    echo model_config.json already exist. skip downloading
) else (
    echo start downloading model_config.json
    curl -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/data/config.json?download=true --output data\config.json

    if %errorlevel% neq 0 (
        echo model_config download retry...
        %CURL_CMD% -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/data/config.json?download=true --output data\config.json
    )
    echo model_config download finished
)

REM models_1
if exist data\G_1780.pth (
    echo model_G_1780.pth already exist. skip downloading
) else (
    echo start downloading model_G_1780.pth
    curl -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/data/G_1780.pth?download=true --output data\G_1780.pth

    if %errorlevel% neq 0 (
        echo model_G_1780 download retry...
        %CURL_CMD% -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/data/G_1780.pth?download=true --output data\G_1780.pth
    )
    echo model_G_1780 download finished
)

REM models_2
if exist data\G_21800.pth (
    echo model_G_21800.pth already exist. skip downloading
) else (
    echo start downloading model_G_21800.pth
    curl -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/data/G_21800.pth?download=true --output data\G_21800.pth

    if %errorlevel% neq 0 (
        echo model_G_21800 download retry...
        %CURL_CMD% -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/data/G_21800.pth?download=true --output data\G_21800.pth
    )
    echo model_G_21800 download finished
)

REM models_3
if exist data\G_40000.pth (
    echo model_G_40000.pth already exist. skip downloading
) else (
    echo start downloading model_G_40000.pth
    curl -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/data/G_40000.pth?download=true --output data\G_40000.pth

    if %errorlevel% neq 0 (
        echo model_G_40000 download retry...
        %CURL_CMD% -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/data/G_40000.pth?download=true --output data\G_40000.pth
    )
    echo model_G_40000 download finished
)

REM dict
if exist dict\ (
    echo dict folder already exists. skipping download
) else (
    echo start downloading dict
    curl -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/dict.zip?download=true -o dict.zip

    if %errorlevel% neq 0 (
        echo dict download retry...
        %CURL_CMD% -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/dict.zip?download=true -o dict.zip
    )

    REM 최종적으로 다운로드 성공 여부 확인
    if %errorlevel% neq 0 (
        echo dict download failed
        pause
        exit /b 1
    )

    REM ZIP 파일을 해제하여 폴더를 얻음
    %PS_CMD% Expand-Archive -Path dict.zip -DestinationPath ./dict -Force

    REM ZIP 파일 삭제
    del dict.zip

    echo dict download finished
)

REM assets
if exist assets\ (
    echo assets folder already exists. skipping download
) else (
    echo start downloading assets
    curl -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/assets.zip?download=true -o assets.zip

    if %errorlevel% neq 0 (
        echo assets download retry...
        %CURL_CMD% -L https://huggingface.co/mingu4969/windows-archive-dist/resolve/main/assets.zip?download=true -o assets.zip
    )

    REM 최종적으로 다운로드 성공 여부 확인
    if %errorlevel% neq 0 (
        echo assets download failed
        pause
        exit /b 1
    )

    REM ZIP 파일을 해제하여 폴더를 얻음
    %PS_CMD% Expand-Archive -Path assets.zip -DestinationPath ./assets -Force

    REM ZIP 파일 삭제
    del assets.zip

    echo assets download finished
)


pause
