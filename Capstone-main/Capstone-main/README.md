This is the code base for my computer system monitoring project as my capstone project.

#Prerequisites:
At least one Windows or Microsoft Server computer or virtual machine for each of the three roles: one management console, one managed host, and one central management server.
All computers connected to the software need to be compatible with Windows PowerShell.
All three computers need to be accessible to eachother through an internal network.
Wireshark and Putty installed on all computers or virtual machine in the environment.
All computers will need to run the SetUp.ps1 script, which will enable SSH and RDP, as well as make rules for them in the firewall.

#Setup:
For each client you want to establish as a managed host, place the Client Files in a folder name C:\Capstone.
For the clients, servers, and management consoles, run the SetUp.ps1 file, this enables SSH and RDP.
Next install Wireshark and Putty on all of the computers in the network. 
WireShark Download Link: https://www.wireshark.org/download.html
Putty Download Link: https://www.putty.org/
For the management consoles, main.ps1 and main.bat in a folder of it's own. Example location: C:\Capstone\ .

#Use:
Double click the main.bat file in or run the main.ps1 file in PowerShell. 
Add clients and servers on your network. They must be on the same subnet.

#Getting Started:
Use the Add Host button to add your first device you would like to manage.
Use the Add Server button to add your first server you would like to use.
You can edit the dashboard to add your devices here as well to get information at a glance.
The dashboard and all the other functions on done by the server in a proxied fashion.
Make sure to have a server and host connected you would like to perform actions on.
If they are not both online, current this can cause the program to freeze, fixes can be implemented in the future.

#System Architecture Overview:
Computer Management System Roles:
The computer management system is comprised of three primary components: the management console, the central management server, and the managed hosts. The management console is the computer system that will be issuing commands and viewing information collected by the computer monitoring system. The central management server acts as a proxy, relaying commands to the managed hosts, and relaying information back to the management consoles. This can allow multiple management consoles to connect to one central management server, where you can centrally store information and connect to managed hosts located on different subnets Finally, the managed hosts are the computer systems that are being accessed and monitored by the management consoles. The managed hosts are the servers and workstations you want to remotely administer and troubleshoot.

The computer management system needs to be deployed on an internal network, which can be configured in a variety of ways. I deployed the computer management system on two separate networks, one on VMWare, and the other on Azure Cloud Services. For both environments, my Windows 10 laptop was used as the management console. 
VMWare is a virtualization platform and hosted two virtual machines for my project, one as a managed host, and one as a central management server. Networking was easy, all I needed to do was connect the virtual machines to the built-in NAT network, which gave access to the other virtual machines and the host computer, which was also the management console. This environment was fast and great for testing.

The Azure Cloud Services deployment involved using a virtual machine in Azure cloud as the central management server, my laptop as the management console, and the two virtual machines in VMWare as the managed hosts. They were all connected to an Azure Virtual Network through a Virtual Network Gateway using a Point to Site connection.  This implementation was very scalable, as features of Azure cloud such as elastic resource allocation allows for a very agile computing environment.

#System Functionality
Primary Functions:
The computer management system was written entirely n PowerShell, but other supporting technologies were used as well. The network traffic was all encrypted by SSH, allowing for the secure transfer of data. There are five primary functions that have been built into the computer management system: a dashboard, a command line interface, a remote desktop access interface, a packet capture interface, and a process management interface. The dashboard is designed to give you a quick summary of information that helps in monitoring and troubleshooting. It would be a good idea to add important servers to the dashboard so you can monitor them. The dashboard allows viewing the following information: IP address, timestamp for of when the information was gathered, port 22 availability (SSH), port 3389 availability (RDP), ICMP availability, CPU usage, and RAM usage. The command line interface allows sending PowerShell commands to the managed hosts, even while the computer is being used by someone else. This can be very helpful for information gathering during technical troubleshooting. The remote desktop interface can automatically connect to a managed host using RDP through SSH port forwarding, allowing for screen, mouse, and keyboard access. This can be used similarly to remote assistance software such as TeamViewer, allowing you to use the computer as if you were in front of it, assuming it is connected to the management system network. The packet capture interface takes advantage of Wireshark to perform packet capture to diagnose network related issues. Once the packet capture has competed, it is sent to the management console and can be opened using Wireshark to analyze the capture. The process management interface allows you to view processes on the managed host, like when using the Task Manager in Windows to view different processes. If for example a program is identified to be causing problems with the performance of the managed host, it can close the program from that interface.

#Technologies and Protocols Used
Programming Languages:

  PowerShell

Network Protocols:

  Secure Shell (SSH)

  Remote Desktop Protocol (RDP)

Supporting Software: 

  Putty

  Wireshark

Operating Systems:

  Server 2019

  Windows 10

Virtualization Software:

  VMWare Workstation Player

Azure Cloud Services:

  Azure Virtual Machine

  Azure Virtual Network

  Azure Virtual Network Gateway

  Azure Storage Service
