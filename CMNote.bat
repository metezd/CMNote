@ECHO OFF && MODE 44,10 && TITLE CMNote: Write notes automatically to a text file && COLOR 1F

:: ##Configuration 

:: change 0 to disable the time display
SET DisplayTime=1

:: change path for cmnotes.txt
SET NotePath=%SystemDrive%\Users\%USERNAME%\Documents\CMNotes.txt
SET BackupPath=%SystemDrive%\Users\%USERNAME%\Documents\CMBackup.bk

:: change 0 to stop printing notes after 
SET PrintNotes=1

:: ## end
ECHO.
SET /p note=Waiting for input: 
powershell -window maximized -command ""
CLS
IF "%DisplayTime%"=="1" (
    ECHO [%DATE%, %TIME%]: "%note%"  && ECHO. && powershell write-host -fore Red Backed up succesfully && ECHO. && ECHO Printing notes
    ECHO [%DATE%, %TIME%]: "%note%" >> %NotePath% && ECHO [%DATE%, %TIME%]: "%note%" >> %BackupPath%
    ) ELSE (
    ECHO [%DATE%]: "%note%" && ECHO. && powershell write-host -fore Red Backed up succesfully. && ECHO. && ECHO Printing notes
    ECHO [%DATE%]: "%note%" >> %NotePath% && ECHO [%DATE%]: "%note%" >> %BackupPath%
    
)
ECHO.
TYPE %SystemDrive%\Users\%USERNAME%\Documents\CMNotes.txt
ECHO.
@pause
