@echo off 
set "command=%1"
set "subcommand=%2"

:: Docker command handling
set "DOCKER_PATH=D:\study\scaler\woolf\cirriculum\capstone\topic\docker"
:: Woolf University command handling
set "WOOLF_PATH=D:\study\scaler\woolf"
:: Diary command handling
set "DIARY_FILE=D:\diary\.txt"
:: Script command handling
set "SCRIPT_FILE=C:\scripts\swar.bat"
:: Notepad++ binary path (adjust if necessary)
set "NOTEPADPP_PATH=C:\Program Files\Notepad++\notepad++.exe"

if "%command%"=="docker" (
    if not exist "%DOCKER_PATH%" (
        echo Error: The specified Docker path doesn't exist, Swar.
        exit /b 1
    )
    
    if "%subcommand%"=="x" (
        explorer "%DOCKER_PATH%"
    ) else (
        start "" /D "%DOCKER_PATH%" cmd
    )
    exit
) else if "%command%"=="woolf" (
    if not exist "%WOOLF_PATH%" (
        echo Error: The specified Woolf path doesn't exist, Swar.
        exit /b 1
    )
    
    if "%subcommand%"=="x" (
        explorer "%WOOLF_PATH%"
    ) else (
        start "" /D "%WOOLF_PATH%" cmd
    )
    exit
) else if "%command%"=="diary" (
    if not exist "%DIARY_FILE%" (
        echo Error: The diary file doesn't exist, Swar.
        exit /b 1
    )
    if "%subcommand%"=="x" (
        explorer "D:\diary"
    ) else (
        if not exist "%NOTEPADPP_PATH%" (
            echo Error: Notepad++ was not found at "%NOTEPADPP_PATH%", Swar.
            exit /b 1
        )
        start "" "%NOTEPADPP_PATH%" "%DIARY_FILE%"
    )
    exit
) else if "%command%"=="script" (
    if not exist "%SCRIPT_FILE%" (
        echo Error: The swar script file doesn't exist, Swar.
        exit /b 1
    )
    if not exist "%NOTEPADPP_PATH%" (
        echo Error: Notepad++ was not found at "%NOTEPADPP_PATH%", Swar.
        exit /b 1
    )
    start "" "%NOTEPADPP_PATH%" "%SCRIPT_FILE%"
    exit
) else (
    echo Unknown command: %command%
    echo Available commands: docker, woolf, diary, script
    exit
)
