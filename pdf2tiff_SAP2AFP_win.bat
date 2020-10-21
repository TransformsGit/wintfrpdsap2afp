echo off

set gs="C:\Program Files\gs\gs9.27\bin\"
echo %gs%

set folder_log=C:\Users\Administrator\Transforms\TestSAP2AFP\Log\win
echo %folder_log%


set folder_out=e:\OutputTransformSAP2AFP\win\output
echo %folder_out%

set folder_in=e:\OutputTransformSAP2AFP\win\output\output_PDF\TestFiles\
echo %folder_in%

for /R %folder_in% %%i in (*.pdf) do (

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

echo Copy.... %folder_out%\output_PDF\TestFiles\PDF\*.tif %folder_out%\out_TIFF\MasterFiles\PDF\
xcopy /y /s /d  %folder_out%\output_PDF\TestFiles\PDF\*.tif %folder_out%\out_TIFF\MasterFiles\PDF\ >> %folder_log%\all_PDF2TIFF_itm-driveraaaa.log 2>&1


echo EXIT
echo EXIT