echo off
set submition_tool=c:\Users\Administrator\Transforms\itm_driver_win.exe
echo %submition_tool%

set folder_in=e:\TestFiles\SAP\
echo %folder_in%

set folder_log=C:\Users\Administrator\Transforms\TestSAP2AFP\Log\win
echo %folder_log%

set folder_out= e:\OutputTransformSAP2AFP\win\output\
echo %folder_out%
echo =============    Transform files from dir and subdir of : %folder_in% ======================================

set /p itm_ipaddress=< c:\Users\Administrator\Transforms\itm_ipaddress_SAP2AFP_win
echo %itm_ipaddress%

echo ++++testSAP2AFP

for /R %folder_in% %%i in (*.abap, *.sapgof, *.sap) do (

echo +++++pass
echo processing.......... %%i

ECHO File drive is **************:   filedrive=%%~di
ECHO File path is **************:  filepath=%%~pi
ECHO File name is  **************: filename=%%~ni
ECHO File extention is **************: fileextension=%%~xi
echo ===============  Working Transform script is:.......... %cd% 

echo ================================================

echo ===============  SAP Transform with default configuration =======================

echo %submition_tool%-S %itm_ipaddress% -P 6986 -F"-itm_in_files %%i -itm_out_files %folder_out%\out_AFP\%%~pi\%%~ni.SAP.afp" -s8050
%submition_tool% -S %itm_ipaddress% -P 6986 -F"-itm_in_files %%i -itm_out_files %folder_out%\out_AFP\%%~pi\%%~ni.SAP.afp" -s8050 

echo ===============  SAP COLOR Transform with default configuration =======================

echo %submition_tool%\ -S %itm_ipaddress% -P 6986 -F"-itm_in_files %%i -a FS45 -itm_out_files %folder_out%\out_AFP\%%~pi\%%~ni.SAP.color.afp" -s8050
%submition_tool%\ -S %itm_ipaddress% -P 6986 -F"-itm_in_files %%i -a FS45 -itm_out_files %folder_out%\out_AFP\%%~pi\%%~ni.SAP.color.afp" -s8050


echo ================================================
 ) >> %folder_log%\testSAP_pdf2afpSAP_itm-driver.log 2>&1


echo EXIT
echo EXIT