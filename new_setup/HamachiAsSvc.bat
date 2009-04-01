REM Following the instructions here: http://www.itsatechworld.com/2006/01/17/hamachi-vpn-solution/
copy srvany.exe "C:\Program Files\Hamachi\srvany.exe"

instsrv AutoHamachi "c:\program files\hamachi\srvany.exe"

REM Open the hosts file and map Hamachi ips to DNS names
echo 5.188.42.118    WorkLaptop  >> c:\windows\system32\drivers\etc\hosts
echo 5.188.42.82     WorkDesktop >> c:\windows\system32\drivers\etc\hosts

echo Go to Start - Control Panel - Administrative Tools - Services Right Click AutoHamachi - click Properties Select "Log On" tab - check "Local System Account" and then under it check "Allow service to interact with the desktop". Go back to the "General" tab and for Startup Type select "Automatic". Reboot the machine and Hamachi should automatically start and connect. You should then be able to start up Hamachi on the the other computers and verify their connectivity.