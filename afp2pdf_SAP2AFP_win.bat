
echo off

set submition_tool=c:\Users\Administrator\Transforms\itm_driver_win.exe
echo %submition_tool%

set folder_in=e:\OutputTransformSAP2AFP\win\output\out_AFP\TestFiles\
echo %folder_in%

set folder_out=e:\OutputTransformSAP2AFP\win\output\out_PDF\TestFiles\
echo %folder_out%

set all_folders=e:\OutputTransformSAP2AFP\win\output\
echo =============    Transform files from dir and subdir of : %all_folders% ======================================


set /p itm_ipaddress=< %c:\Users\Administrator\Transforms\itm_ipaddress_SAP2AFP_win%
echo %itm_ipaddress%


set folder_log=e:\OutputTransformSAP2AFP\win\output\out_PDF\TestFiles\
echo %folder_log%


for /R %all_folders% %%i in (*.afp ) do (
echo processing.......... %%i
ECHO File drive is **************:   filedrive=%%~di
ECHO File path is **************:  filepath=%%~pi
ECHO File name is  **************: filename=%%~ni
ECHO File extention is **************: fileextension=%%~xi

echo ===============  Working Transform script is:.......... %cd% =====================

echo ===============   Transform all AFP resulted from all Transforms to PDF =======================

echo %submition_tool% -S %itm_ipaddress% -P 6986 -F"-itm_in_files %%i -itm_out_files e:\%%~pi\%%~ni.pdf" -s8040
%submition_tool% -S %itm_ipaddress% -P 6986 -F"-itm_in_files %%i -itm_out_files  e:\%%~pi\%%~ni.pdf" -s8040 
 
 
 ) >> %folder_log%\all_afp2pdf_itm-driver.log 2>&1
 
echo ================================================

echo Copy.... %folder_in%\*.pdf %folder_out%
xcopy /y /s /d %folder_in%\*.pdf %folder_out% >> %folder_log%\allcopy_afp2pdf_itm-driver.log 2>&1

echo EXIT
echo EXIT


