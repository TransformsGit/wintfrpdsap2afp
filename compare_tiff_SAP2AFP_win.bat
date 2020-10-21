@echo off
REM script must be in Test tools installation directory
time /T >> regr.log


set TTDIR=c:\TESTTOOLS\
set MASTERDIR=e:\MasterFiles\PDF\
set CMPDIR=e:\OutputTransformSAP2AFP\win\output\out_TIFF\
set folder_log=C:\Users\Administrator\Transforms\TestPDF2AFP_CPSI\Log\win

echo running tiffcompare >> regr.log
set CURDIR=%CD%
pushd %TTDIR%

for /R %MASTERDIR% %%i in (*.tif) do (
echo processing.......... %%i
ECHO File drive is **************:   filedrive=%%~di% 
ECHO File path is **************:  filepath=%%~pi
ECHO File name is  **************: filename=%%~ni
ECHO File extention is **************: fileextension=%%~xi
Echo File for compare is ************: file for compare = %%~nxi 
ECHO %TESTOOLS%

 	if EXIST %CMPDIR%\%%~pi (
ECHO ====================================================


		CALL c:\TESTTOOLS\compare.bat %%i %CMPDIR%\%%~pi\%%~ni.tif -method fuzzy -nlines 5 >> %folder_log%\output_regression_diff.log
echo CALL c:\TESTTOOLS\compare.bat %%i %CMPDIR%\%%~pi\%%~ni.tif -method fuzzy -nlines 5 >> %folder_log%\files.log	
	) else (
		echo no output was generated for %%i %CMPDIR%\%%~pi>> %folder_log%\output_notfound_diff.log
	)	
)
popd

time /T >> %folder_log%\regr.log

