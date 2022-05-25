echo "Quick Privilege Escalation Checker priv.sh"
echo "------------------------------------------"
echo ""
echo "System Information"
echo "------------------"
echo ""
echo "Hostname"
hostname
echo ""
echo "OS Release"
lsb_release -a 2>/dev/null
echo ""
echo "Linux Kernel Version"
uname -a
echo ""
echo "Listing Adapters Using: ip a"
ip a
echo ""
echo "Environment Variables"
env
echo ""
echo ""
echo "User Information"
echo "----------------"
echo ""
echo "Current User"
whoami
echo ""
echo "Logged in Users"
who
echo ""
echo "User Groups List"
groups 
echo ""
echo "/etc/passwd Contents, If Available"
cat /etc/passwd
echo ""
echo "Bash History if the History File is Available"
cat ~/.bash_history
echo ""
echo "Finding id_rsa SSH Key Files"
find / -name  id_rsa 2> /dev/null
echo ""
echo ""
echo "Sudo and SUID/SGID Files"
echo "------------------------"
echo ""
echo "Sudo Capabilities of the Current User"
sudo -l
echo ""
echo "Capabilities of the Current User"
getcap -r / 2>/dev/null
echo "Searching for SUID Files"
echo "Can take a while..."
find / -perm -u=s -type f 2>/dev/null
echo ""
echo "Searching for SGID Files"
echo "Can take a while..."
find / -perm -g=s -type f 2>/dev/null
echo ""
echo ""
echo "Checking Processes and Scheduled Tasks"
echo "--------------------------------------"
echo ""
echo "Listing All Processes"
netstat -ano
echo ""
echo "Listing All Root Processes"
ps aux | grep "^root"
echo ""
echo "Lists the CronTab for the Current User"
crontab -l
echo ""
echo "Enumerating Running Cron Jobs"
ls -al /etc/cron*
echo ""
echo ""
echo "Searching for Potentially Important Files"
echo "-----------------------------------------"
echo ""
echo "Checking the /opt Directory"
ls /opt
echo ""
echo "Checking for Programming Languages"
which bash
which python
which perl
which go
which ruby
echo ""
echo "Checking for File Upload Tools"
which wget
which nc
which tftp
which ftp
which ssh
