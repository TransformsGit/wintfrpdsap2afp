echo off
set machine=172.27.105.150
echo %machine%
set password=Passw0rd!
echo %password%
set user_name=root
echo %user_name%

   cd C:\plink\
  
   echo connecting to %machine% ...  via ssh...
   echo %cd%
   echo y | C:\plink\plink.exe -ssh %machine% -l %root% -pw %password% 
   C:\plink\plink.exe -batch -hostkey 6d:57:d4:46:08:34:96:db:c7:fe:87:6d:10:b3:e4:ab -sshlog ssh153.log -m restore_img153.txt %user_name%@%machine% -pw %password%  >>log_ssh153.txt


echo STOP
echo STOP
echo STOP


echo EXIT