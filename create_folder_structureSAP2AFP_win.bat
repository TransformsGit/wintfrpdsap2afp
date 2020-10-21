@ECHO OFF

Set dir=E:\OutputTransformSAP2AFP\win\output\
Echo Deleting all files from %dir%
del %dir%\* /F /Q

Echo Deleting all folders from %dir%
for /d %%p in (%dir%\*) Do rd /Q /S "%%p"
@echo Folder deleted.

set folder_out=E:\OutputTransformSAP2AFP\win\output\
echo %folder_out%

mkdir  %folder_out%\out_AFP\TestFiles
echo mkdir %folder_out%\out_AFP\TestFiles

mkdir  %folder_out%\out_PDF\TestFiles
echo mkdir  %folder_out%\out_PDF\TestFiles

mkdir  %folder_out%\out_TIFF\MasterFiles
echo mkdir  %folder_out%\out_TIFF\MasterFiles

c:\Windows\System32\xcopy.exe /T /e e:\TestFiles_folder_structure\TestFiles\*  %folder_out%\out_AFP\TestFiles\ /s /i
c:\Windows\System32\xcopy.exe /T /e e:\TestFiles_folder_structure\TestFiles\*  %folder_out%\out_PDF\TestFiles\ /s /i
c:\Windows\System32\xcopy.exe /T /e e:\TestFiles_folder_structure\TestFiles\*  %folder_out%\out_TIFF\MasterFiles\ /s /i


echo Folder structure succesfully done!