echo "Quick Privilege Escalation Checker priv.ps1"
echo "-------------------------------------------"
echo ""
echo "System Information"
echo "------------------"
echo ""
echo "Hostname"
hostname
echo ""
echo "Current User"
whoami
echo ""
echo "Operating System"
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
echo ""
echo "Installed Patches"
wmic qfe get Caption,Description,HotFixID,InstalledOn
echo ""
echo "List of Network Adapters"
ipconfig
echo ""
echo "Environment Variables"
dir env:
echo ""
echo "Installed Programs"
Get-ChildItem 'C:\Program Files', 'C:\Program Files (x86)' | ft Parent,Name,LastWriteTime
echo ""
echo "Checks the Registry for Installed Programs"
Get-ChildItem -path Registry::HKEY_LOCAL_MACHINE\SOFTWARE | ft Name
echo ""
echo ""
echo "User Information"
echo "----------------"
echo ""
echo "Lists Privileges Available to the Current User"
whoami /priv
echo ""
echo "List of Local Users"
net users
echo ""
echo "Displays Local Groups"
net localgroup
echo ""
echo "Gets a List of the Local Administrators"
Get-LocalGroupMember Administrators | ft Name, PrincipalSource
echo ""
echo ""
echo "Registry Enumeration"
echo "--------------------"
echo ""
echo "Checking for AlwaysInstallElevated Key"
echo "An Error Message Means It Doesn't Exist."
reg query HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Installer
reg query HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer 
echo ""
echo ""
echo "Services and Processes"
echo "----------------------"
echo ""
echo "List of Services"
Get-Service
echo ""
echo "List of Processes"
echo "If the owner is blank, it could be SYSTEM, NETWORK SERVICE, or LOCAL SERVICE."
Get-WmiObject -Query "Select * from Win32_Process" | where {$_.Name -notlike "svchost*"} | Select Name, Handle, @{Label="Owner";Expression={$_.GetOwner().User}} | ft -AutoSize
echo ""
echo "List of Scheduled Tasks Without a Microsoft Path"
Get-ScheduledTask | where {$_.TaskPath -notlike "\Microsoft*"} | ft TaskName,TaskPath,State
echo ""
echo "Looks for Unquoted Service Paths"
gwmi -class Win32_Service -Property Name, DisplayName, PathName, StartMode | Where {$_.StartMode -eq "Auto" -and $_.PathName -notlike "C:\Windows*" -and $_.PathName -notlike '"*'} | select PathName,DisplayName,Name
echo ""