echo off

set gs="C:\Program Files\gs\gs9.27\bin\"
echo %gs%

set folder_log=C:\Users\Administrator\Transforms\TestSAP2AFP\Log\win
echo %folder_log%

set folder_out=e:\OutputTransformSAP2AFP\win\output\out_TIFF\MasterFiles\SAP\
echo %folder_out%

set folderIN=e:\OutputTransformSAP2AFP\win\output\out_PDF\TestFiles\SAP\
echo %folderIN%

for /R %folderIN% %%i in (*.pdf) do (

ECHO File drive is **************:   filedrive=%%~di
ECHO File path is **************:  filepath=%%~pi
ECHO File name is  **************: filename=%%~ni
ECHO File extention is **************: fileextension=%%~xi

   echo processing... %%i 
   echo "c:\Program Files\gs\gs9.27\bin\gswin64c.exe" -dNOPAUSE -q -sDEVICE=tiff24nc -dBATCH -sOutputFile=e:\%%~pi\%%~ni.tif %%i
  "c:\Program Files\gs\gs9.27\bin\gswin64c.exe" -dNOPAUSE -q -sDEVICE=tiff24nc -dBATCH -sOutputFile=e:\%%~pi\%%~ni.tif %%i
  echo ========================  

 ) >> %folder_log%\all_PDF2TIFF_itm-driver.log 2>&1

echo ================================================

echo Copy.... e:\OutputTransformSAP2AFP\win\output\out_PDF\TestFiles\*.tif E:\OutputTransformSAP2AFP\win\output\out_TIFF\MasterFiles\
xcopy /y /s /d  e:\OutputTransformSAP2AFP\win\output\out_PDF\TestFiles\*.tif E:\OutputTransformSAP2AFP\win\output\out_TIFF\MasterFiles\ >> C:\Users\Administrator\Transforms\TestSAP2AFP\Log\win\all_PDF2TIFF_itm-driveraaaa.log 2>&1

echo EXIT
echo EXIT