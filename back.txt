@echo off
set DB_NAME=report
set BACKUP_DIR=E:\backups
set TIMESTAMP=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set BACKUP_FILE=%BACKUP_DIR%\%DB_NAME%-%TIMESTAMP%.sql

REM Create backup directory if it doesn't exist
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

REM Perform MySQL database backup using credentials from my.cnf
mysqldump --defaults-file=E:\my.cnf %DB_NAME% > "%BACKUP_FILE%"

REM Verify if backup was successful
if %ERRORLEVEL% EQU 0 (
    echo Backup Successful: %BACKUP_FILE%
) else (
    echo Backup Failed!
)

pause
