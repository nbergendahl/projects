#creates the script for getting network adapters 
New-Item C:\Capstone\NetworkAdapters.ps1
Set-Content C:\Capstone\NetworkAdapters.ps1 'cd "C:\Program Files\Wireshark\"; $adapters = (& ./tshark.exe -D); $adapters -replace ".*}" -replace "[()]", "" | echo'
