@echo off
set DB_NAME=report
set BACKUP_FILE=E:\backups\report-20250216_133431.sql
REM Check if backup file exists
if not exist "%BACKUP_FILE%" (
    echo Backup file not found: %BACKUP_FILE%
    pause
    exit /b
)

REM Restore the MySQL database using my.cnf for credentials
mysql --defaults-file=E:\my.cnf %DB_NAME% < "%BACKUP_FILE%"

REM Verify if restore was successful
if %ERRORLEVEL% EQU 0 (
    echo Database Restore Successful!
) else (
    echo Database Restore Failed!
)

pause
