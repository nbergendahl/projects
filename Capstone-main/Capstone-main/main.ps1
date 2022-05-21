#Captstone Project: Remote Device Management
#By: Nicholas Bergendahl

Add-Type -AssemblyName System.Windows.Forms,PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

#global variables
$ip = 0

#code for objects

#main form
$MainForm                        = New-Object system.Windows.Forms.Form
$MainForm.ClientSize             = New-Object System.Drawing.Point(775,450)
$MainForm.text                   = "Remote Device Manager"
$MainForm.TopMost                = $false
$MainForm.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainForm.StartPosition          = "CenterScreen"
$MainForm.AutoSize               = $true


#label for EndPoint combobox
$MainSelectEndPointLabel                 = New-Object system.Windows.Forms.Label
$MainSelectEndPointLabel.text            = "Select Session"
$MainSelectEndPointLabel.AutoSize        = $true
$MainSelectEndPointLabel.width           = 25
$MainSelectEndPointLabel.height          = 10
$MainSelectEndPointLabel.location        = New-Object System.Drawing.Point(880,25)
$MainSelectEndPointLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#combobox for selecting endpoints
$MainComboboxSelectEndPoint                = New-Object system.Windows.Forms.ComboBox
$MainComboboxSelectEndPoint.text           = ""
$MainComboboxSelectEndPoint.width          = 150
$maincomboboxSelectEndPoint.height         = 20
$MainComboboxSelectEndPoint.location       = New-Object System.Drawing.Point(880,60)
$MainComboboxSelectEndPoint.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainComboboxSelectEndPoint.DropDownStyle  = "DropDownList"
#populates the combobox with IP addresses from the sessions.csv file
$sessions = Import-Csv "$PSScriptRoot\sessions.csv"
@($sessions.IP_Address) | ForEach-Object {[void] $MainComboboxSelectEndPoint.Items.Add($_)}


#label for select server combobox label
$MainSelectServerLabel                 = New-Object system.Windows.Forms.Label
$MainSelectServerLabel.text            = "Select Server"
$MainSelectServerLabel.AutoSize        = $true
$MainSelectServerLabel.width           = 25
$MainSelectServerLabel.height          = 10
$MainSelectServerLabel.location        = New-Object System.Drawing.Point(880,110)
$MainSelectServerLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#combobox for selecting servers
$MainComboboxSelectServer                = New-Object system.Windows.Forms.ComboBox
$MainComboboxSelectServer.text           = ""
$MainComboboxSelectServer.width          = 150
$MainComboboxSelectServer.height         = 20
$MainComboboxSelectServer.location       = New-Object System.Drawing.Point(880,145)
$MainComboboxSelectServer.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainComboboxSelectServer.DropDownStyle  = "DropDownList"
##populates the combobox with IP addresses from the servers.csv file
$sessions = Import-Csv "$PSScriptRoot\servers.csv"
@($sessions.IP_Address) | ForEach-Object {[void] $MainComboboxSelectServer.Items.Add($_)}


#button for opening the adding server form
$MainButtonAddServer                   = New-Object system.Windows.Forms.Button
$MainButtonAddServer.text               = "Add Server"
$MainButtonAddServer.width              = 151
$MainButtonAddServer.height             = 30
$MainButtonAddServer.location           = New-Object System.Drawing.Point(1045,115)
$MainButtonAddServer.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonAddServer.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonAddServer.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")


#button for removing server from list
$MainButtonRemoveServer                    = New-Object system.Windows.Forms.Button
$MainButtonRemoveServer.text               = "Remove Server"
$MainButtonRemoveServer.width              = 151
$MainButtonRemoveServer.height             = 30
$MainButtonRemoveServer.location           = New-Object System.Drawing.Point(1045,145)
$MainButtonRemoveServer.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonRemoveServer.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonRemoveServer.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")


#label for Administrative Functions
$MainAdministrativeFunctionsLabel                 = New-Object system.Windows.Forms.Label
$MainAdministrativeFunctionsLabel.text            = "Administrative Functions"
$MainAdministrativeFunctionsLabel.AutoSize        = $true
$MainAdministrativeFunctionsLabel.width           = 25
$MainAdministrativeFunctionsLabel.height          = 10
$MainAdministrativeFunctionsLabel.location        = New-Object System.Drawing.Point(880,195)
$MainAdministrativeFunctionsLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#opens SSH on a selected host
$MainButtonPacketCapture              = New-Object system.Windows.Forms.Button
$MainButtonPacketCapture.text         = "Packet Capture"
$MainButtonPacketCapture.width        = 200
$MainButtonPacketCapture.height       = 30
$MainButtonPacketCapture.location     = New-Object System.Drawing.Point(880,265)
$MainButtonPacketCapture.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonPacketCapture.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonPacketCapture.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$MainButtonPacketCapture.Autosize     = $true


#opens SSH on a selected host
$MainButtonOpenRDP              = New-Object system.Windows.Forms.Button
$MainButtonOpenRDP.text         = "Open RDP"
$MainButtonOpenRDP.width        = 200
$MainButtonOpenRDP.height       = 30
$MainButtonOpenRDP.location     = New-Object System.Drawing.Point(880,305)
$MainButtonOpenRDP.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonOpenRDP.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonOpenRDP.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$MainButtonOpenRDP.Autosize     = $true


#opens SSH on a selected host
$MainButtonOpenSSH              = New-Object system.Windows.Forms.Button
$MainButtonOpenSSH.text         = "Open PowerShell"
$MainButtonOpenSSH.width        = 200
$MainButtonOpenSSH.height       = 30
$MainButtonOpenSSH.location     = New-Object System.Drawing.Point(880,345)
$MainButtonOpenSSH.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonOpenSSH.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonOpenSSH.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$MainButtonOpenSSH.Autosize     = $true


#button for opening the adding host form
$MainButtonAddHost                    = New-Object system.Windows.Forms.Button
$MainButtonAddHost.text               = "Add Host"
$MainButtonAddHost.width              = 151
$MainButtonAddHost.height             = 30
$MainButtonAddHost.location           = New-Object System.Drawing.Point(1045,25)
$MainButtonAddHost.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonAddHost.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonAddHost.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")

#button for removing host
$MainButtonRemoveHost                    = New-Object system.Windows.Forms.Button
$MainButtonRemoveHost.text               = "Remove Host"
$MainButtonRemoveHost.width              = 151
$MainButtonRemoveHost.height             = 30
$MainButtonRemoveHost.location           = New-Object System.Drawing.Point(1045,60)
$MainButtonRemoveHost.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonRemoveHost.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonRemoveHost.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")


#opens processes for opening processes
$MainButtonOpenProcesses                    = New-Object system.Windows.Forms.Button
$MainButtonOpenProcesses.text               = "Open Processes"
$MainButtonOpenProcesses.width              = 200
$MainButtonOpenProcesses.height             = 30
$MainButtonOpenProcesses.location           = New-Object System.Drawing.Point(880,225)
$MainButtonOpenProcesses.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonOpenProcesses.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonOpenProcesses.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")


#opens edit dashboard menu
$MainButtonAddtoDashboard                    = New-Object system.Windows.Forms.Button
$MainButtonAddtoDashboard.text               = "Edit Dashboard"
$MainButtonAddtoDashboard.width              = 175
$MainButtonAddtoDashboard.height             = 30
$MainButtonAddtoDashboard.location           = New-Object System.Drawing.Point(15,260)
$MainButtonAddtoDashboard.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonAddtoDashboard.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonAddtoDashboard.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")


#refreshes the dashboard data
$MainButtonRefreshDashboard                    = New-Object system.Windows.Forms.Button
$MainButtonRefreshDashboard.text               = "Refresh Dashboard"
$MainButtonRefreshDashboard.width              = 210
$MainButtonRefreshDashboard.height             = 30
$MainButtonRefreshDashboard.location           = New-Object System.Drawing.Point(625,260)
$MainButtonRefreshDashboard.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonRefreshDashboard.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonRefreshDashboard.BackColor          = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")


#closes the main form
$MainButtonClose              = New-Object system.Windows.Forms.Button
$MainButtonClose.text         = "Close Program"
$MainButtonClose.width        = 200
$MainButtonClose.height       = 30
$MainButtonClose.location     = New-Object System.Drawing.Point(1000,400)
$MainButtonClose.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainButtonClose.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$MainButtonClose.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("DodgerBlue")
$MainButtonClose.Autosize     = $true


#label for dashboard host IP
$MainDashboardHostIPLabel                = New-Object system.Windows.Forms.Label
$MainDashboardHostIPLabel.text            = "Host IP"
$MainDashboardHostIPLabel.AutoSize        = $true
$MainDashboardHostIPLabel.width           = 25
$MainDashboardHostIPLabel.height          = 10
$MainDashboardHostIPLabel.location        = New-Object System.Drawing.Point(15,25)
$MainDashboardHostIPLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#label for dashboard timestamp
$MainDashboardTimestampLabel                = New-Object system.Windows.Forms.Label
$MainDashboardTimestampLabel.text            = "Time"
$MainDashboardTimestampLabel.AutoSize        = $true
$MainDashboardTimestampLabel.width           = 25
$MainDashboardTimestampLabel.height          = 10
$MainDashboardTimestampLabel.location        = New-Object System.Drawing.Point(135,25)
$MainDashboardTimestampLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#label for dashboard port 22 connectivity
$MainDashboardPort22Label                = New-Object system.Windows.Forms.Label
$MainDashboardPort22Label.text            = "Port 22"
$MainDashboardPort22Label.AutoSize        = $true
$MainDashboardPort22Label.width           = 25
$MainDashboardPort22Label.height          = 10
$MainDashboardPort22Label.location        = New-Object System.Drawing.Point(255,25)
$MainDashboardPort22Label.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#label for dashboard port 3389 connectivity
$MainDashboardPort3389Label                = New-Object system.Windows.Forms.Label
$MainDashboardPort3389Label.text            = "Port 3389"
$MainDashboardPort3389Label.AutoSize        = $true
$MainDashboardPort3389Label.width           = 25
$MainDashboardPort3389Label.height          = 10
$MainDashboardPort3389Label.location        = New-Object System.Drawing.Point(375,25)
$MainDashboardPort3389Label.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#label for dashboard icmp connectivity
$MainDashboardICMPLabel                = New-Object system.Windows.Forms.Label
$MainDashboardICMPLabel.text            = "ICMP"
$MainDashboardICMPLabel.AutoSize        = $true
$MainDashboardICMPLabel.width           = 25
$MainDashboardICMPLabel.height          = 10
$MainDashboardICMPLabel.location        = New-Object System.Drawing.Point(495,25)
$MainDashboardICMPLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#label for dashboard RAM usage
$MainDashboardRAMLabel                 = New-Object system.Windows.Forms.Label
$MainDashboardRAMLabel.text            = "RAM"
$MainDashboardRAMLabel.AutoSize        = $true
$MainDashboardRAMLabel.width           = 25
$MainDashboardRAMLabel.height          = 10
$MainDashboardRAMLabel.location        = New-Object System.Drawing.Point(735,25)
$MainDashboardRAMLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#label for dashboard CPU usage
$MainDashboardCPULabel                 = New-Object system.Windows.Forms.Label
$MainDashboardCPULabel.text            = "CPU"
$MainDashboardCPULabel.AutoSize        = $true
$MainDashboardCPULabel.width           = 25
$MainDashboardCPULabel.height          = 10
$MainDashboardCPULabel.location        = New-Object System.Drawing.Point(615,25)
$MainDashboardCPULabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#host ip textbox dashboard1
$MainDashboardHostIPTextbox1                 = New-Object system.Windows.Forms.TextBox
$MainDashboardHostIPTextbox1.text            = ""
$MainDashboardHostIPTextbox1.multiline       = $false
$MainDashboardHostIPTextbox1.width           = 100
$MainDashboardHostIPTextbox1.height          = 20
$MainDashboardHostIPTextbox1.location        = New-Object System.Drawing.Point(15,60)
$MainDashboardHostIPTextbox1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardHostIPTextbox1.ReadOnly        = $True


#host ip textbox dashboard2
$MainDashboardHostIPTextbox2                 = New-Object system.Windows.Forms.TextBox
$MainDashboardHostIPTextbox2.text            = ""
$MainDashboardHostIPTextbox2.multiline       = $false
$MainDashboardHostIPTextbox2.width           = 100
$MainDashboardHostIPTextbox2.height          = 20
$MainDashboardHostIPTextbox2.location        = New-Object System.Drawing.Point(15,110)
$MainDashboardHostIPTextbox2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardHostIPTextbox2.ReadOnly        = $True


#host ip textbox dashboard3
$MainDashboardHostIPTextbox3                 = New-Object system.Windows.Forms.TextBox
$MainDashboardHostIPTextbox3.text            = ""
$MainDashboardHostIPTextbox3.multiline       = $false
$MainDashboardHostIPTextbox3.width           = 100
$MainDashboardHostIPTextbox3.height          = 20
$MainDashboardHostIPTextbox3.location        = New-Object System.Drawing.Point(15,160)
$MainDashboardHostIPTextbox3.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardHostIPTextbox3.ReadOnly        = $True


#host ip textbox dashboard4
$MainDashboardHostIPTextbox4                 = New-Object system.Windows.Forms.TextBox
$MainDashboardHostIPTextbox4.text            = ""
$MainDashboardHostIPTextbox4.multiline       = $false
$MainDashboardHostIPTextbox4.width           = 100
$MainDashboardHostIPTextbox4.height          = 20
$MainDashboardHostIPTextbox4.location        = New-Object System.Drawing.Point(15,210)
$MainDashboardHostIPTextbox4.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardHostIPTextbox4.ReadOnly        = $True


#Timestamp textbox dashboard1
$MainDashboardTimestampTextbox1                 = New-Object system.Windows.Forms.TextBox
$MainDashboardTimestampTextbox1.text            = ""
$MainDashboardTimestampTextbox1.multiline       = $false
$MainDashboardTimestampTextbox1.width           = 100
$MainDashboardTimestampTextbox1.height          = 20
$MainDashboardTimestampTextbox1.location        = New-Object System.Drawing.Point(135,60)
$MainDashboardTimestampTextbox1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardTimestampTextbox1.ReadOnly        = $True


#Timestamp textbox dashboard2
$MainDashboardTimestampTextbox2                 = New-Object system.Windows.Forms.TextBox
$MainDashboardTimestampTextbox2.text            = ""
$MainDashboardTimestampTextbox2.multiline       = $false
$MainDashboardTimestampTextbox2.width           = 100
$MainDashboardTimestampTextbox2.height          = 20
$MainDashboardTimestampTextbox2.location        = New-Object System.Drawing.Point(135,110)
$MainDashboardTimestampTextbox2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardTimestampTextbox2.ReadOnly        = $True


#Timestamp textbox dashboard3
$MainDashboardTimestampTextbox3                 = New-Object system.Windows.Forms.TextBox
$MainDashboardTimestampTextbox3.text            = ""
$MainDashboardTimestampTextbox3.multiline       = $false
$MainDashboardTimestampTextbox3.width           = 100
$MainDashboardTimestampTextbox3.height          = 20
$MainDashboardTimestampTextbox3.location        = New-Object System.Drawing.Point(135,160)
$MainDashboardTimestampTextbox3.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardTimestampTextbox3.ReadOnly        = $True


#Timestamp textbox dashboard4
$MainDashboardTimestampTextbox4                 = New-Object system.Windows.Forms.TextBox
$MainDashboardTimestampTextbox4.text            = ""
$MainDashboardTimestampTextbox4.multiline       = $false
$MainDashboardTimestampTextbox4.width           = 100
$MainDashboardTimestampTextbox4.height          = 20
$MainDashboardTimestampTextbox4.location        = New-Object System.Drawing.Point(135,210)
$MainDashboardTimestampTextbox4.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardTimestampTextbox4.ReadOnly        = $True


#port22 textbox dashboard1
$MainDashboardPort22Textbox1                 = New-Object system.Windows.Forms.TextBox
$MainDashboardPort22Textbox1.text            = ""
$MainDashboardPort22Textbox1.multiline       = $false
$MainDashboardPort22Textbox1.width           = 100
$MainDashboardPort22Textbox1.height          = 20
$MainDashboardPort22Textbox1.location        = New-Object System.Drawing.Point(255,60)
$MainDashboardPort22Textbox1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardPort22Textbox1.ReadOnly        = $True


#port22 textbox dashboard2
$MainDashboardPort22Textbox2                 = New-Object system.Windows.Forms.TextBox
$MainDashboardPort22Textbox2.text            = ""
$MainDashboardPort22Textbox2.multiline       = $false
$MainDashboardPort22Textbox2.width           = 100
$MainDashboardPort22Textbox2.height          = 20
$MainDashboardPort22Textbox2.location        = New-Object System.Drawing.Point(255,110)
$MainDashboardPort22Textbox2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardPort22Textbox2.ReadOnly        = $True


#port22 textbox dashboard3
$MainDashboardPort22Textbox3                 = New-Object system.Windows.Forms.TextBox
$MainDashboardPort22Textbox3.text            = ""
$MainDashboardPort22Textbox3.multiline       = $false
$MainDashboardPort22Textbox3.width           = 100
$MainDashboardPort22Textbox3.height          = 20
$MainDashboardPort22Textbox3.location        = New-Object System.Drawing.Point(255,160)
$MainDashboardPort22Textbox3.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardPort22Textbox3.ReadOnly        = $True


#port22 textbox dashboard4
$MainDashboardPort22Textbox4                 = New-Object system.Windows.Forms.TextBox
$MainDashboardPort22Textbox4.text            = ""
$MainDashboardPort22Textbox4.multiline       = $false
$MainDashboardPort22Textbox4.width           = 100
$MainDashboardPort22Textbox4.height          = 20
$MainDashboardPort22Textbox4.location        = New-Object System.Drawing.Point(255,210)
$MainDashboardPort22Textbox4.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardPort22Textbox4.ReadOnly        = $True


#port3389 textbox dashboard1
$MainDashboardPort3389Textbox1                 = New-Object system.Windows.Forms.TextBox
$MainDashboardPort3389Textbox1.text            = ""
$MainDashboardPort3389Textbox1.multiline       = $false
$MainDashboardPort3389Textbox1.width           = 100
$MainDashboardPort3389Textbox1.height          = 20
$MainDashboardPort3389Textbox1.location        = New-Object System.Drawing.Point(375,60)
$MainDashboardPort3389Textbox1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardPort3389Textbox1.ReadOnly        = $True


#port3389 textbox dashboard2
$MainDashboardPort3389Textbox2                 = New-Object system.Windows.Forms.TextBox
$MainDashboardPort3389Textbox2.text            = ""
$MainDashboardPort3389Textbox2.multiline       = $false
$MainDashboardPort3389Textbox2.width           = 100
$MainDashboardPort3389Textbox2.height          = 20
$MainDashboardPort3389Textbox2.location        = New-Object System.Drawing.Point(375,110)
$MainDashboardPort3389Textbox2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardPort3389Textbox2.ReadOnly        = $True


#port3389 textbox dashboard3
$MainDashboardPort3389Textbox3                 = New-Object system.Windows.Forms.TextBox
$MainDashboardPort3389Textbox3.text            = ""
$MainDashboardPort3389Textbox3.multiline       = $false
$MainDashboardPort3389Textbox3.width           = 100
$MainDashboardPort3389Textbox3.height          = 20
$MainDashboardPort3389Textbox3.location        = New-Object System.Drawing.Point(375,160)
$MainDashboardPort3389Textbox3.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardPort3389Textbox3.ReadOnly        = $True


#port3389 textbox dashboard4
$MainDashboardPort3389Textbox4                 = New-Object system.Windows.Forms.TextBox
$MainDashboardPort3389Textbox4.text            = ""
$MainDashboardPort3389Textbox4.multiline       = $false
$MainDashboardPort3389Textbox4.width           = 100
$MainDashboardPort3389Textbox4.height          = 20
$MainDashboardPort3389Textbox4.location        = New-Object System.Drawing.Point(375,210)
$MainDashboardPort3389Textbox4.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardPort3389Textbox4.ReadOnly        = $True


#ICMP textbox dashboard1
$MainDashboardICMPTextbox1                 = New-Object system.Windows.Forms.TextBox
$MainDashboardICMPTextbox1.text            = ""
$MainDashboardICMPTextbox1.multiline       = $false
$MainDashboardICMPTextbox1.width           = 100
$MainDashboardICMPTextbox1.height          = 20
$MainDashboardICMPTextbox1.location        = New-Object System.Drawing.Point(495,60)
$MainDashboardICMPTextbox1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardICMPTextbox1.ReadOnly        = $True


#ICMP textbox dashboard2
$MainDashboardICMPTextbox2                 = New-Object system.Windows.Forms.TextBox
$MainDashboardICMPTextbox2.text            = ""
$MainDashboardICMPTextbox2.multiline       = $false
$MainDashboardICMPTextbox2.width           = 100
$MainDashboardICMPTextbox2.height          = 20
$MainDashboardICMPTextbox2.location        = New-Object System.Drawing.Point(495,110)
$MainDashboardICMPTextbox2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardICMPTextbox2.ReadOnly        = $True


#ICMP textbox dashboard3
$MainDashboardICMPTextbox3                 = New-Object system.Windows.Forms.TextBox
$MainDashboardICMPTextbox3.text            = ""
$MainDashboardICMPTextbox3.multiline       = $false
$MainDashboardICMPTextbox3.width           = 100
$MainDashboardICMPTextbox3.height          = 20
$MainDashboardICMPTextbox3.location        = New-Object System.Drawing.Point(495,160)
$MainDashboardICMPTextbox3.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardICMPTextbox3.ReadOnly        = $True


#ICMP textbox dashboard4
$MainDashboardICMPTextbox4                 = New-Object system.Windows.Forms.TextBox
$MainDashboardICMPTextbox4.text            = ""
$MainDashboardICMPTextbox4.multiline       = $false
$MainDashboardICMPTextbox4.width           = 100
$MainDashboardICMPTextbox4.height          = 20
$MainDashboardICMPTextbox4.location        = New-Object System.Drawing.Point(495,210)
$MainDashboardICMPTextbox4.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardICMPTextbox4.ReadOnly        = $True


#CPU textbox dashboard1
$MainDashboardCPUTextbox1                 = New-Object system.Windows.Forms.TextBox
$MainDashboardCPUTextbox1.text            = ""
$MainDashboardCPUTextbox1.multiline       = $false
$MainDashboardCPUTextbox1.width           = 100
$MainDashboardCPUTextbox1.height          = 20
$MainDashboardCPUTextbox1.location        = New-Object System.Drawing.Point(615,60)
$MainDashboardCPUTextbox1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardCPUTextbox1.ReadOnly        = $True


#CPU textbox dashboard2
$MainDashboardCPUTextbox2                 = New-Object system.Windows.Forms.TextBox
$MainDashboardCPUTextbox2.text            = ""
$MainDashboardCPUTextbox2.multiline       = $false
$MainDashboardCPUTextbox2.width           = 100
$MainDashboardCPUTextbox2.height          = 20
$MainDashboardCPUTextbox2.location        = New-Object System.Drawing.Point(615,110)
$MainDashboardCPUTextbox2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardCPUTextbox2.ReadOnly        = $True


#CPU textbox dashboard3
$MainDashboardCPUTextbox3                 = New-Object system.Windows.Forms.TextBox
$MainDashboardCPUTextbox3.text            = ""
$MainDashboardCPUTextbox3.multiline       = $false
$MainDashboardCPUTextbox3.width           = 100
$MainDashboardCPUTextbox3.height          = 20
$MainDashboardCPUTextbox3.location        = New-Object System.Drawing.Point(615,160)
$MainDashboardCPUTextbox3.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardCPUTextbox3.ReadOnly        = $True


#CPU textbox dashboard4
$MainDashboardCPUTextbox4                 = New-Object system.Windows.Forms.TextBox
$MainDashboardCPUTextbox4.text            = ""
$MainDashboardCPUTextbox4.multiline       = $false
$MainDashboardCPUTextbox4.width           = 100
$MainDashboardCPUTextbox4.height          = 20
$MainDashboardCPUTextbox4.location        = New-Object System.Drawing.Point(615,210)
$MainDashboardCPUTextbox4.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardCPUTextbox4.ReadOnly        = $True


#RAM textbox dashboard1
$MainDashboardRAMTextbox1                 = New-Object system.Windows.Forms.TextBox
$MainDashboardRAMTextbox1.text            = ""
$MainDashboardRAMTextbox1.multiline       = $false
$MainDashboardRAMTextbox1.width           = 100
$MainDashboardRAMTextbox1.height          = 20
$MainDashboardRAMTextbox1.location        = New-Object System.Drawing.Point(735,60)
$MainDashboardRAMTextbox1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardRAMTextbox1.ReadOnly        = $True


#RAM textbox dashboard2
$MainDashboardRAMTextbox2                 = New-Object system.Windows.Forms.TextBox
$MainDashboardRAMTextbox2.text            = ""
$MainDashboardRAMTextbox2.multiline       = $false
$MainDashboardRAMTextbox2.width           = 100
$MainDashboardRAMTextbox2.height          = 20
$MainDashboardRAMTextbox2.location        = New-Object System.Drawing.Point(735,110)
$MainDashboardRAMTextbox2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardRAMTextbox2.ReadOnly        = $True


#RAM textbox dashboard3
$MainDashboardRAMTextbox3                 = New-Object system.Windows.Forms.TextBox
$MainDashboardRAMTextbox3.text            = ""
$MainDashboardRAMTextbox3.multiline       = $false
$MainDashboardRAMTextbox3.width           = 100
$MainDashboardRAMTextbox3.height          = 20
$MainDashboardRAMTextbox3.location        = New-Object System.Drawing.Point(735,160)
$MainDashboardRAMTextbox3.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardRAMTextbox3.ReadOnly        = $True


#RAM textbox dashboard4
$MainDashboardRAMTextbox4                 = New-Object system.Windows.Forms.TextBox
$MainDashboardRAMTextbox4.text            = ""
$MainDashboardRAMTextbox4.multiline       = $false
$MainDashboardRAMTextbox4.width           = 100
$MainDashboardRAMTextbox4.height          = 20
$MainDashboardRAMTextbox4.location        = New-Object System.Drawing.Point(735,210)
$MainDashboardRAMTextbox4.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$MainDashboardRAMTextbox4.ReadOnly        = $True



#adds object to main form
$MainForm.controls.AddRange(@($MainSelectEndPointLabel,$MainComboboxSelectEndPoint,$MainButtonRemoveHost,$MainButtonOpenSSH,$MainButtonAddHost,$MainButtonOpenProcesses,$MainButtonOpenRDP,$MainButtonPacketCapture,$MainButtonAddtoDashboard,$MainButtonClose,$MainAdministrativeFunctionsLabel,$MainButtonRefreshDashboard,$MainDashboardHostIPLabel,$MainDashboardTimestampLabel,$MainDashboardPort22Label,$MainDashboardPort3389Label,$MainDashboardICMPLabel,$MainDashboardRAMLabel, $MainDashboardCPULabel,$MainDashboardHostIPTextbox1,$MainDashboardHostIPTextbox2,$MainDashboardHostIPTextbox3,$MainDashboardHostIPTextbox4,$MainDashboardTimestampTextbox1,$MainDashboardTimestampTextbox2,$MainDashboardTimestampTextbox3,$MainDashboardTimestampTextbox4,$MainDashboardPort22Textbox1,$MainDashboardPort22Textbox2,$MainDashboardPort22Textbox3,$MainDashboardPort22Textbox4,$MainDashboardPort3389Textbox1,$MainDashboardPort3389Textbox2,$MainDashboardPort3389Textbox3,$MainDashboardPort3389Textbox4,$MainDashboardICMPTextbox1,$MainDashboardICMPTextbox2,$MainDashboardICMPTextbox3,$MainDashboardICMPTextbox4,$MainDashboardCPUTextbox1,$MainDashboardCPUTextbox2,$MainDashboardCPUTextbox3,$MainDashboardCPUTextbox4,$MainDashboardRAMTextbox1,$MainDashboardRAMTextbox2,$MainDashboardRAMTextbox3,$MainDashboardRAMTextbox4,$MainSelectServerLabel,$MainButtonAddServer,$MainButtonRemoveServer,$MainComboboxSelectServer))

#events for the main form objects
$MainButtonAddHost.Add_Click({ [void]$AddHostForm.ShowDialog() })
$MainButtonAddServer.Add_Click({ [void]$AddServerForm.ShowDialog() })
$MainButtonOpenSSH.Add_Click({ [void]$TerminalWindowForm.ShowDialog() })
$MainButtonOpenProcesses.Add_Click({ MainButtonOpenProcessesClick })
$MainButtonRemoveHost.Add_Click({ MainButtonRemoveHostClick })
$MainButtonOpenRDP.Add_Click({ MainButtonOpenRDPClick })
$MainButtonAddtoDashboard.Add_Click({ [void]$EditDashboardForm.ShowDialog() })
$MainButtonPacketCapture.Add_Click({ [void]$PacketCaptureForm.ShowDialog() })
$MainButtonClose.Add_Click({ [void]$MainForm.Close() })
$MainButtonRefreshDashboard.Add_Click({ MainButtonRefreshDashboardClick })



####################################################

#form for adding hosts
$AddHostForm                        = New-Object system.Windows.Forms.Form
$AddHostForm.ClientSize             = New-Object System.Drawing.Point(550,150)
$AddHostForm.text                   = "Add Host"
$AddHostForm.TopMost                = $true
$AddHostForm.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$AddHostForm.StartPosition          = "CenterScreen"
$AddHostForm.AutoSize               = $true

#label for adding hots text box
$AddHostLabel                 = New-Object system.Windows.Forms.Label
$AddHostLabel.text            = "IP Address"
$AddHostLabel.AutoSize        = $true
$AddHostLabel.width           = 25
$AddHostLabel.height          = 10
$AddHostLabel.location        = New-Object System.Drawing.Point(10,50)
$AddHostLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for entering IP addresses
$AddHostTextBox                 = New-Object system.Windows.Forms.TextBox
$AddHostTextBox.text            = ""
$AddHostTextBox.multiline       = $false
$AddHostTextBox.width           = 460
$AddHostTextBox.height          = 20
$AddHostTextBox.location        = New-Object System.Drawing.Point(15,85)
$AddHostTextBox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#opens SSH on a selected host
$AddHostButton              = New-Object system.Windows.Forms.Button
$AddHostButton.text         = "Add Host"
$AddHostButton.width        = 154
$AddHostButton.height       = 30
$AddHostButton.location     = New-Object System.Drawing.Point(600,425)
$AddHostButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$AddHostButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$AddHostButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$AddHostButton.Autosize     = $true

#label for adding usernames textbox
$AddHostUserNameLabel                 = New-Object system.Windows.Forms.Label
$AddHostUserNameLabel.text            = "UserName"
$AddHostUserNameLabel.AutoSize        = $true
$AddHostUserNameLabel.width           = 25
$AddHostUserNameLabel.height          = 10
$AddHostUserNameLabel.location        = New-Object System.Drawing.Point(10,120)
$AddHostUserNameLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for entering usernames
$AddHostUserNameTextBox                 = New-Object system.Windows.Forms.TextBox
$AddHostUserNameTextBox.text            = ""
$AddHostUserNameTextBox.multiline       = $false
$AddHostUserNameTextBox.width           = 460
$AddHostUserNameTextBox.height          = 20
$AddHostUserNameTextBox.location        = New-Object System.Drawing.Point(15,155)
$AddHostUserNameTextBox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#label for password text box
$AddHostPasswordLabel                 = New-Object system.Windows.Forms.Label
$AddHostPasswordLabel.text            = "Password"
$AddHostPasswordLabel.AutoSize        = $true
$AddHostPasswordLabel.width           = 25
$AddHostPasswordLabel.height          = 10
$AddHostPasswordLabel.location        = New-Object System.Drawing.Point(10,190)
$AddHostPasswordLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for passwords
$AddHostPasswordTextBox                 = New-Object system.Windows.Forms.TextBox
$AddHostPasswordTextBox.text            = ""
$AddHostPasswordTextBox.multiline       = $false
$AddHostPasswordTextBox.width           = 460
$AddHostPasswordTextBox.height          = 20
$AddHostPasswordTextBox.location        = New-Object System.Drawing.Point(15,225)
$AddHostPasswordTextBox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for entering IP addresses
$AddHostTextBox                 = New-Object system.Windows.Forms.TextBox
$AddHostTextBox.text            = ""
$AddHostTextBox.multiline       = $false
$AddHostTextBox.width           = 460
$AddHostTextBox.height          = 20
$AddHostTextBox.location        = New-Object System.Drawing.Point(15,85)
$AddHostTextBox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#opens adds the info to the csv
$AddHostButton              = New-Object system.Windows.Forms.Button
$AddHostButton.text         = "Add Host"
$AddHostButton.width        = 154
$AddHostButton.height       = 30
$AddHostButton.location     = New-Object System.Drawing.Point(475,285)
$AddHostButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$AddHostButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$AddHostButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$AddHostButton.Autosize     = $true


#button to close the add host window
$AddHostCloseWindowButton              = New-Object system.Windows.Forms.Button
$AddHostCloseWindowButton.text         = "Close Window"
$AddHostCloseWindowButton.width        = 154
$AddHostCloseWindowButton.height       = 30
$AddHostCloseWindowButton.location     = New-Object System.Drawing.Point(475,325)
$AddHostCloseWindowButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$AddHostCloseWindowButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$AddHostCloseWindowButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$AddHostCloseWindowButton.Autosize     = $true


#adds objects to AddHost form
$AddHostForm.controls.AddRange(@($AddHostLabel,$AddHostTextBox,$AddHostButton,$AddHostUserNameLabel,$AddHostUserNameTextBox, $AddHostPasswordLabel, $AddHostPasswordTextBox,$AddHostCloseWindowButton))

#events from the AddHost form
$AddHostButton.Add_Click({ AddHostButtonClick })
$AddHostCloseWindowButton.Add_Click({ [void]$AddHostForm.Close() })



#################################

#form for custom terminal windows
$TerminalWindowForm                        = New-Object system.Windows.Forms.Form
$TerminalWindowForm.ClientSize             = New-Object System.Drawing.Point(750,500)
$TerminalWindowForm.text                   = "Terminal Window"
$TerminalWindowForm.TopMost                = $true
$TerminalWindowForm.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$TerminalWindowForm.StartPosition          = "CenterScreen"
$TerminalWindowForm.AutoSize               = $true

#data grid view object for terminal window output
$TerminalOutputDataGridView                           = New-Object System.Windows.Forms.DataGridView 
$TerminalOutputDataGridView.ClientSize                = New-Object System.Drawing.Size(900,300)
$TerminalOutputDataGridView.location                  = New-Object System.Drawing.Point(15,15)
$TerminalOutputDataGridView.ColumnHeadersVisible      = $true
$TerminalOutputDataGridView.ColumnHeadersHeight       = 20
$TerminalOutputDataGridView.AutoSizeColumnsMode       = "AllCells"
$TerminalOutputDataGridView.ReadOnly                  = $true

#Terminal windows input textbox
$TerminalInputTextbox                 = New-Object system.Windows.Forms.TextBox
$TerminalInputTextbox.text            = ""
$TerminalInputTextbox.multiline       = $true
$TerminalInputTextbox.ScrollBars      = "Vertical"
$TerminalInputTextbox.width           = 900
$TerminalInputTextbox.height          = 150
$TerminalInputTextbox.location        = New-Object System.Drawing.Point(15,325)
$TerminalInputTextbox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$TerminalInputTextbox.ReadOnly        = $false
$TerminalInputTextbox.AcceptsReturn   = $true
$TerminalInputTextbox.AcceptsTab      = $true

#button to send terminal intput code to endpoint
$TerminalInputButton              = New-Object system.Windows.Forms.Button
$TerminalInputButton.text         = "Send PowerShell Commands"
$TerminalInputButton.width        = 154
$TerminalInputButton.height       = 30
$TerminalInputButton.location     = New-Object System.Drawing.Point(15,480)
$TerminalInputButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$TerminalInputButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$TerminalInputButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$TerminalInputButton.Autosize     = $true


#button to close the terminal window
$TerminalCloseWindowButton              = New-Object system.Windows.Forms.Button
$TerminalCloseWindowButton.text         = "Close Window"
$TerminalCloseWindowButton.width        = 154
$TerminalCloseWindowButton.height       = 30
$TerminalCloseWindowButton.location     = New-Object System.Drawing.Point(750,480)
$TerminalCloseWindowButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$TerminalCloseWindowButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$TerminalCloseWindowButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$TerminalCloseWindowButton.Autosize     = $true


#adds object to terminal window form
$TerminalWindowForm.controls.AddRange(@($TerminalOutputDataGridView,$TerminalInputTextbox,$TerminalInputButton,$TerminalCloseWindowButton))

#events from terminal window form
$TerminalInputButton.Add_Click({ TerminalInputButtonClick })
$TerminalCloseWindowButton.Add_Click({ [void]$TerminalWindowForm.Close() })


################################################
#form for process list
$ProcessListForm
$ProcessListForm                        = New-Object system.Windows.Forms.Form
$ProcessListForm.ClientSize             = New-Object System.Drawing.Point(750,500)
$ProcessListForm.text                   = "Process List"
$ProcessListForm.TopMost                = $true
$ProcessListForm.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$ProcessListForm.StartPosition          = "CenterScreen"
$ProcessListForm.AutoSize               = $true


#data grid view object for process list form
$ProcessListDataGridView                           = New-Object System.Windows.Forms.DataGridView 
$ProcessListDataGridView.ClientSize                = New-Object System.Drawing.Size(800,400)
$ProcessListDataGridView.ColumnHeadersVisible      = $true
$ProcessListDataGRidView.ColumnHeadersHeight       = 20
$ProcessListDataGRidView.ReadOnly                  = $true


#button to remove tasks
$ProcessListStopProcess              = New-Object system.Windows.Forms.Button
$ProcessListStopProcess.text         = "Stop Process"
$ProcessListStopProcess.width        = 154
$ProcessListStopProcess.height       = 30
$ProcessListStopProcess.location     = New-Object System.Drawing.Point(380,480)
$ProcessListStopProcess.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$ProcessListStopProcess.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$ProcessListStopProcess.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$ProcessListStopProcess.Autosize     = $true


#button to close the process list window
$ProcessListCloseWindowButton              = New-Object system.Windows.Forms.Button
$ProcessListCloseWindowButton.text         = "Close Window"
$ProcessListCloseWindowButton.width        = 154
$ProcessListCloseWindowButton.height       = 30
$ProcessListCloseWindowButton.location     = New-Object System.Drawing.Point(650,480)
$ProcessListCloseWindowButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$ProcessListCloseWindowButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$ProcessListCloseWindowButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$ProcessListCloseWindowButton.Autosize     = $true


#adds objects to data grid view process list
$ProcessListForm.controls.AddRange(@($ProcessListDataGridView,$ProcessListStopProcess,$ProcessListCloseWindowButton))

$ProcessListStopProcess.Add_Click({ ProcessListStopProcessClick })
$ProcessListCloseWindowButton.Add_Click({ [void]$ProcessListForm.Close() })


##################################################
#form for wireshark packet capture
$PacketCaptureForm                        = New-Object system.Windows.Forms.Form
$PacketCaptureForm.ClientSize             = New-Object System.Drawing.Point(600,400)
$PacketCaptureForm.text                   = "Packet Capture"
$PacketCaptureForm.TopMost                = $false
$PacketCaptureForm.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$PacketCaptureForm.StartPosition          = "CenterScreen"
$PacketCaptureForm.AutoSize               = $true

#label for select adpater combobox
$PacketCaptureSelectAdapterLabel                 = New-Object system.Windows.Forms.Label
$PacketCaptureSelectAdapterLabel.text            = "Select Network Adapter"
$PacketCaptureSelectAdapterLabel.AutoSize        = $true
$PacketCaptureSelectAdapterLabel.width           = 25
$PacketCaptureSelectAdapterLabel.height          = 10
$PacketCaptureSelectAdapterLabel.location        = New-Object System.Drawing.Point(15,25)
$PacketCaptureSelectAdapterLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#combobox for selecting adapters
$PacketCaptureSelectAdapterComboBox               = New-Object system.Windows.Forms.ComboBox
$PacketCaptureSelectAdapterComboBox.text          = "Select Interface"
$PacketCaptureSelectAdapterComboBox.width         = 270
$PacketCaptureSelectAdapterComboBox.height        = 20
$PacketCaptureSelectAdapterComboBox.location      = New-Object System.Drawing.Point(15,55)
$PacketCaptureSelectAdapterComboBox.Font          = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$PacketCaptureSelectAdapterComboBox.DropDownStyle = "DropDownList"

#button to populate network adapters
$PacketCaptureAddAdapterButton              = New-Object system.Windows.Forms.Button
$PacketCaptureAddAdapterButton.text         = "Refresh Network Adapter List"
$PacketCaptureAddAdapterButton.width        = 154
$PacketCaptureAddAdapterButton.height       = 30
$PacketCaptureAddAdapterButton.location     = New-Object System.Drawing.Point(300,55)
$PacketCaptureAddAdapterButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$PacketCaptureAddAdapterButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$PacketCaptureAddAdapterButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$PacketCaptureAddAdapterButton.Autosize     = $true

#label for packet capture size
$PacketCaptureSizeLabel                 = New-Object system.Windows.Forms.Label
$PacketCaptureSizeLabel.text            = "(Recommended) Set Capture Size (in Kilobytes)"
$PacketCaptureSizeLabel.AutoSize        = $true
$PacketCaptureSizeLabel.width           = 25
$PacketCaptureSizeLabel.height          = 10
$PacketCaptureSizeLabel.location        = New-Object System.Drawing.Point(15,100)
$PacketCaptureSizeLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for entering packet capture size
$PacketCaptureSizeTextbox                 = New-Object system.Windows.Forms.TextBox
$PacketCaptureSizeTextbox.text            = ""
$PacketCaptureSizeTextbox.multiline       = $false
$PacketCaptureSizeTextbox.width           = 200
$PacketCaptureSizeTextbox.height          = 20
$PacketCaptureSizeTextbox.location        = New-Object System.Drawing.Point(15,130)
$PacketCaptureSizeTextbox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#label for packet capture duration 
$PacketCaptureDurationLabel                 = New-Object system.Windows.Forms.Label
$PacketCaptureDurationLabel.text            = "(Optional) Set Capture Duration (in seconds)"
$PacketCaptureDurationLabel.AutoSize        = $true
$PacketCaptureDurationLabel.width           = 25
$PacketCaptureDurationLabel.height          = 10
$PacketCaptureDurationLabel.location        = New-Object System.Drawing.Point(15,200)
$PacketCaptureDurationLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for setting packet capture duration
$PacketCaptureDurationTextbox                 = New-Object system.Windows.Forms.TextBox
$PacketCaptureDurationTextbox.text            = ""
$PacketCaptureDurationTextbox.multiline       = $false
$PacketCaptureDurationTextbox.width           = 200
$PacketCaptureDurationTextbox.height          = 20
$PacketCaptureDurationTextbox.location        = New-Object System.Drawing.Point(15,230)
$PacketCaptureDurationTextbox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#label for write location
$PacketCaptureWriteLocationLabel                 = New-Object system.Windows.Forms.Label
$PacketCaptureWriteLocationLabel.text            = "Select Write Location"
$PacketCaptureWriteLocationLabel.AutoSize        = $true
$PacketCaptureWriteLocationLabel.width           = 25
$PacketCaptureWriteLocationLabel.height          = 10
$PacketCaptureWriteLocationLabel.location        = New-Object System.Drawing.Point(15,270)
$PacketCaptureWriteLocationLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for setting packet capture write location 
$PacketCaptureWriteLocationTextbox                 = New-Object system.Windows.Forms.TextBox
$PacketCaptureWriteLocationTextbox.text            = ""
$PacketCaptureWriteLocationTextbox.multiline       = $false
$PacketCaptureWriteLocationTextbox.width           = 200
$PacketCaptureWriteLocationTextbox.height          = 20
$PacketCaptureWriteLocationTextbox.location        = New-Object System.Drawing.Point(15,300)
$PacketCaptureWriteLocationTextbox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#label for local save location
$PacketCaptureLocalLocationLabel                 = New-Object system.Windows.Forms.Label
$PacketCaptureLocalLocationLabel.text            = "Select Local Location to Save"
$PacketCaptureLocalLocationLabel.AutoSize        = $true
$PacketCaptureLocalLocationLabel.width           = 25
$PacketCaptureLocalLocationLabel.height          = 10
$PacketCaptureLocalLocationLabel.location        = New-Object System.Drawing.Point(15,340)
$PacketCaptureLocalLocationLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for local save location
$PacketCaptureLocalLocationTextbox                 = New-Object system.Windows.Forms.TextBox
$PacketCaptureLocalLocationTextbox.text            = ""
$PacketCaptureLocalLocationTextbox.multiline       = $false
$PacketCaptureLocalLocationTextbox.width           = 200
$PacketCaptureLocalLocationTextbox.height          = 20
$PacketCaptureLocalLocationTextbox.location        = New-Object System.Drawing.Point(15,370)
$PacketCaptureLocalLocationTextbox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#button to pick file location for packet capture
$PacketCaptureWriteLocationButton              = New-Object system.Windows.Forms.Button
$PacketCaptureWriteLocationButton.text         = "Select Write Location"
$PacketCaptureWriteLocationButton.width        = 154
$PacketCaptureWriteLocationButton.height       = 30
$PacketCaptureWriteLocationButton.location     = New-Object System.Drawing.Point(230,370)
$PacketCaptureWriteLocationButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$PacketCaptureWriteLocationButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$PacketCaptureWriteLocationButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$PacketCaptureWriteLocationButton.Autosize     = $true

#button to start packet capture
$PacketCaptureStartButton              = New-Object system.Windows.Forms.Button
$PacketCaptureStartButton.text         = "Start Capture"
$PacketCaptureStartButton.width        = 154
$PacketCaptureStartButton.height       = 30
$PacketCaptureStartButton.location     = New-Object System.Drawing.Point(15,440)
$PacketCaptureStartButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$PacketCaptureStartButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$PacketCaptureStartButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$PacketCaptureStartButton.Autosize     = $true

#button to stop packet capture
$PacketCaptureStopCaptureButton              = New-Object system.Windows.Forms.Button
$PacketCaptureStopCaptureButton.text         = "Stop Capture"
$PacketCaptureStopCaptureButton.width        = 154
$PacketCaptureStopCaptureButton.height       = 30
$PacketCaptureStopCaptureButton.location     = New-Object System.Drawing.Point(15,480)
$PacketCaptureStopCaptureButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$PacketCaptureStopCaptureButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$PacketCaptureStopCaptureButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$PacketCaptureStopCaptureButton.Autosize     = $true

#button to close the packet capture window
$PacketCaptureCloseWindowButton              = New-Object system.Windows.Forms.Button
$PacketCaptureCloseWindowButton.text         = "Close Window"
$PacketCaptureCloseWindowButton.width        = 154
$PacketCaptureCloseWindowButton.height       = 30
$PacketCaptureCloseWindowButton.location     = New-Object System.Drawing.Point(450,480)
$PacketCaptureCloseWindowButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$PacketCaptureCloseWindowButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$PacketCaptureCloseWindowButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$PacketCaptureCloseWindowButton.Autosize     = $true



#adds objects to PacketCaptureForm
$PacketCaptureForm.controls.AddRange(@($PacketCaptureSelectAdapterComboBox,$PacketCaptureSelectAdapterLabel,$PacketCaptureAddAdapterButton,$PacketCaptureSizeLabel,$PacketCaptureSizeTextbox,$PacketCaptureDurationLabel,$PacketCaptureDurationTextbox,$PacketCaptureWriteLocationLabel,$PacketCaptureWriteLocationTextbox,$PacketCaptureWriteLocationButton,$PacketCaptureStartButton,$PacketCaptureStopCaptureButton,$PacketCaptureCloseWindowButton,$PacketCaptureLocalLocationLabel,$PacketCaptureLocalLocationTextbox))

#events from packet capture form
$PacketCaptureAddAdapterButton.Add_Click({ PacketCaptureAddAdapterButtonClick })
$PacketCaptureWriteLocationButton.Add_Click({ PacketCaptureWriteLocationButtonClick })
$PacketCaptureStartButton.Add_Click({ PacketCaptureStartButtonClick })
$PacketCaptureCloseWindowButton.Add_Click({ [void]$PacketCaptureForm.Close() })



############################
#add to dashboard form
$EditDashBoardForm                        = New-Object system.Windows.Forms.Form
$EditDashBoardForm.ClientSize             = New-Object System.Drawing.Point(600,400)
$EditDashBoardForm.text                   = "Edit Dashboard"
$EditDashBoardForm.TopMost                = $false
$EditDashBoardForm.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$EditDashBoardForm.StartPosition          = "CenterScreen"
$EditDashBoardForm.AutoSize               = $true


#label for add host to dashboard1
$EditDashboardAddHostLabel1                 = New-Object system.Windows.Forms.Label
$EditDashboardAddHostLabel1.text            = "Add Host to Dashboard1"
$EditDashboardAddHostLabel1.AutoSize        = $true
$EditDashboardAddHostLabel1.width           = 25
$EditDashboardAddHostLabel1.height          = 10
$EditDashboardAddHostLabel1.location        = New-Object System.Drawing.Point(15,15)
$EditDashboardAddHostLabel1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#Text box for dashboard1
$EditDashboardTextbox1                 = New-Object system.Windows.Forms.TextBox
$data = (Get-Content -path "$PSScriptRoot\dashboard1.txt")
$EditDashboardTextbox1.text            = "$data"
$EditDashboardTextbox1.multiline       = $false
$EditDashboardTextbox1.width           = 200
$EditDashboardTextbox1.height          = 20
$EditDashboardTextbox1.location        = New-Object System.Drawing.Point(15,45)
$EditDashboardTextbox1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardTextbox1.ReadOnly       = $True


#combobox for selecting endpoints dashboard1
$EditDashboardComboboxSelectEndPoint1                = New-Object system.Windows.Forms.ComboBox
$EditDashboardComboboxSelectEndPoint1.text           = ""
$EditDashboardComboboxSelectEndPoint1.width          = 150
$EditDashboardComboboxSelectEndPoint1.height         = 20
$EditDashboardComboboxSelectEndPoint1.location       = New-Object System.Drawing.Point(235,45)
$EditDashboardComboboxSelectEndPoint1.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardComboboxSelectEndPoint1.DropDownStyle  = "DropDownList"
#"$PSScriptRoot\sessions.csv"
$sessions = Import-Csv "$PSScriptRoot\sessions.csv"
@($sessions.IP_Address) | ForEach-Object {[void] $EditDashboardComboboxSelectEndPoint1.Items.Add($_)}


#edit dashboard add host button dashboard1
$EditDashboardAddHostButton1              = New-Object system.Windows.Forms.Button
$EditDashboardAddHostButton1.text         = "Add Host"
$EditDashboardAddHostButton1.width        = 154
$EditDashboardAddHostButton1.height       = 30
$EditDashboardAddHostButton1.location     = New-Object System.Drawing.Point(400,35)
$EditDashboardAddHostButton1.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardAddHostButton1.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$EditDashboardAddHostButton1.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$EditDashboardAddHostButton1.Autosize     = $true


#label for add host to dashboard2
$EditDashboardAddHostLabel2                 = New-Object system.Windows.Forms.Label
$EditDashboardAddHostLabel2.text            = "Add Host to Dashboard2"
$EditDashboardAddHostLabel2.AutoSize        = $true
$EditDashboardAddHostLabel2.width           = 25
$EditDashboardAddHostLabel2.height          = 10
$EditDashboardAddHostLabel2.location        = New-Object System.Drawing.Point(15,100)
$EditDashboardAddHostLabel2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#Text box for dashboard2
$EditDashboardTextbox2                 = New-Object system.Windows.Forms.TextBox
$data = (Get-Content -path "$PSScriptRoot\dashboard2.txt")
$EditDashboardTextbox2.text            = "$data"
$EditDashboardTextbox2.multiline       = $false
$EditDashboardTextbox2.width           = 200
$EditDashboardTextbox2.height          = 20
$EditDashboardTextbox2.location        = New-Object System.Drawing.Point(15,130)
$EditDashboardTextbox2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardTextbox2.ReadOnly       = $True


#combobox for selecting endpoints dashboard2
$EditDashboardComboboxSelectEndPoint2                = New-Object system.Windows.Forms.ComboBox
$EditDashboardComboboxSelectEndPoint2.text           = ""
$EditDashboardComboboxSelectEndPoint2.width          = 150
$EditDashboardComboboxSelectEndPoint2.height         = 20
$EditDashboardComboboxSelectEndPoint2.location       = New-Object System.Drawing.Point(235,130)
$EditDashboardComboboxSelectEndPoint2.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardComboboxSelectEndPoint2.DropDownStyle  = "DropDownList"
#"$PSScriptRoot\sessions.csv"
$sessions = Import-Csv "$PSScriptRoot\sessions.csv"
@($sessions.IP_Address) | ForEach-Object {[void] $EditDashboardComboboxSelectEndPoint2.Items.Add($_)}


#edit dashboard add host button dashboard2
$EditDashboardAddHostButton2              = New-Object system.Windows.Forms.Button
$EditDashboardAddHostButton2.text         = "Add Host"
$EditDashboardAddHostButton2.width        = 154
$EditDashboardAddHostButton2.height       = 30
$EditDashboardAddHostButton2.location     = New-Object System.Drawing.Point(400,120)
$EditDashboardAddHostButton2.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardAddHostButton2.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$EditDashboardAddHostButton2.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$EditDashboardAddHostButton2.Autosize     = $true


#label for add host to dashboard3
$EditDashboardAddHostLabel3                 = New-Object system.Windows.Forms.Label
$EditDashboardAddHostLabel3.text            = "Add Host to Dashboard3"
$EditDashboardAddHostLabel3.AutoSize        = $true
$EditDashboardAddHostLabel3.width           = 25
$EditDashboardAddHostLabel3.height          = 10
$EditDashboardAddHostLabel3.location        = New-Object System.Drawing.Point(15,185)
$EditDashboardAddHostLabel3.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#Text box for dashboard3
$EditDashboardTextbox3                 = New-Object system.Windows.Forms.TextBox
$data = (Get-Content -path "$PSScriptRoot\dashboard3.txt")
$EditDashboardTextbox3.text            = "$data"
$EditDashboardTextbox3.multiline       = $false
$EditDashboardTextbox3.width           = 200
$EditDashboardTextbox3.height          = 20
$EditDashboardTextbox3.location        = New-Object System.Drawing.Point(15,215)
$EditDashboardTextbox3.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardTextbox3.ReadOnly       = $True


#combobox for selecting endpoints dashboard3
$EditDashboardComboboxSelectEndPoint3                = New-Object system.Windows.Forms.ComboBox
$EditDashboardComboboxSelectEndPoint3.text           = ""
$EditDashboardComboboxSelectEndPoint3.width          = 150
$EditDashboardComboboxSelectEndPoint3.height         = 20
$EditDashboardComboboxSelectEndPoint3.location       = New-Object System.Drawing.Point(235,215)
$EditDashboardComboboxSelectEndPoint3.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardComboboxSelectEndPoint3.DropDownStyle  = "DropDownList"
#"$PSScriptRoot\sessions.csv"
$sessions = Import-Csv "$PSScriptRoot\sessions.csv"
@($sessions.IP_Address) | ForEach-Object {[void] $EditDashboardComboboxSelectEndPoint3.Items.Add($_)}


#edit dashboard add host button dashboard3
$EditDashboardAddHostButton3              = New-Object system.Windows.Forms.Button
$EditDashboardAddHostButton3.text         = "Add Host"
$EditDashboardAddHostButton3.width        = 154
$EditDashboardAddHostButton3.height       = 30
$EditDashboardAddHostButton3.location     = New-Object System.Drawing.Point(400,205)
$EditDashboardAddHostButton3.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardAddHostButton3.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$EditDashboardAddHostButton3.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$EditDashboardAddHostButton3.Autosize     = $true


#label for add host to dashboard4
$EditDashboardAddHostLabel4                 = New-Object system.Windows.Forms.Label
$EditDashboardAddHostLabel4.text            = "Add Host to Dashboard4"
$EditDashboardAddHostLabel4.AutoSize        = $true
$EditDashboardAddHostLabel4.width           = 25
$EditDashboardAddHostLabel4.height          = 10
$EditDashboardAddHostLabel4.location        = New-Object System.Drawing.Point(15,270)
$EditDashboardAddHostLabel4.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#Text box for dashboard4
$EditDashboardTextbox4                 = New-Object system.Windows.Forms.TextBox
$data = (Get-Content -path "$PSScriptRoot\dashboard4.txt")
$EditDashboardTextbox4.text            = "$data"
$EditDashboardTextbox4.multiline       = $false
$EditDashboardTextbox4.width           = 200
$EditDashboardTextbox4.height          = 20
$EditDashboardTextbox4.location        = New-Object System.Drawing.Point(15,300)
$EditDashboardTextbox4.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardTextbox4.ReadOnly       = $True


#combobox for selecting endpoints dashboard4
$EditDashboardComboboxSelectEndPoint4                = New-Object system.Windows.Forms.ComboBox
$EditDashboardComboboxSelectEndPoint4.text           = ""
$EditDashboardComboboxSelectEndPoint4.width          = 150
$EditDashboardComboboxSelectEndPoint4.height         = 20
$EditDashboardComboboxSelectEndPoint4.location       = New-Object System.Drawing.Point(235,300)
$EditDashboardComboboxSelectEndPoint4.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardComboboxSelectEndPoint4.DropDownStyle  = "DropDownList"
#"$PSScriptRoot\sessions.csv"
$sessions = Import-Csv "$PSScriptRoot\sessions.csv"
@($sessions.IP_Address) | ForEach-Object {[void] $EditDashboardComboboxSelectEndPoint4.Items.Add($_)}


#edit dashboard add host button dashboard4
$EditDashboardAddHostButton4              = New-Object system.Windows.Forms.Button
$EditDashboardAddHostButton4.text         = "Add Host"
$EditDashboardAddHostButton4.width        = 154
$EditDashboardAddHostButton4.height       = 30
$EditDashboardAddHostButton4.location     = New-Object System.Drawing.Point(400,290)
$EditDashboardAddHostButton4.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardAddHostButton4.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$EditDashboardAddHostButton4.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$EditDashboardAddHostButton4.Autosize     = $true


#button to close the edit dashboard window
$EditDashboardCloseWindowButton              = New-Object system.Windows.Forms.Button
$EditDashboardCloseWindowButton.text         = "Close Window"
$EditDashboardCloseWindowButton.width        = 154
$EditDashboardCloseWindowButton.height       = 30
$EditDashboardCloseWindowButton.location     = New-Object System.Drawing.Point(450,350)
$EditDashboardCloseWindowButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$EditDashboardCloseWindowButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$EditDashboardCloseWindowButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$EditDashboardCloseWindowButton.Autosize     = $true


#adds objects to dashboard form
$EditDashBoardForm.controls.AddRange(@($EditDashboardAddHostLabel1,$EditDashboardComboboxSelectEndPoint1,$EditDashboardAddHostButton1,$EditDashboardTextbox1,$EditDashboardAddHostLabel2,$EditDashboardTextbox2,$EditDashboardComboboxSelectEndPoint2,$EditDashboardAddHostButton2,$EditDashboardAddHostLabel3,$EditDashboardTextbox3,$EditDashboardComboboxSelectEndPoint3,$EditDashboardAddHostButton3,$EditDashboardAddHostLabel4,$EditDashboardTextbox4,$EditDashboardComboboxSelectEndPoint4,$EditDashboardAddHostButton4,$EditDashboardCloseWindowButton))

#events for editing the dashboard
$EditDashboardAddHostButton1.Add_Click({ EditDashboardAddHostButton1Click })
$EditDashboardAddHostButton2.Add_Click({ EditDashboardAddHostButton2Click })
$EditDashboardAddHostButton3.Add_Click({ EditDashboardAddHostButton3Click })
$EditDashboardAddHostButton4.Add_Click({ EditDashboardAddHostButton4Click })
$EditDashboardCloseWindowButton.Add_Click({ [void]$EditDashBoardForm.Close() })



####################################
#form for adding servers
$AddServerForm                        = New-Object system.Windows.Forms.Form
$AddServerForm.ClientSize             = New-Object System.Drawing.Point(550,150)
$AddServerForm.text                   = "Add Host"
$AddServerForm.TopMost                = $true
$AddServerForm.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$AddServerForm.StartPosition          = "CenterScreen"
$AddServerForm.AutoSize               = $true

#label for adding server text box
$AddServerLabel                 = New-Object system.Windows.Forms.Label
$AddServerLabel.text            = "IP Address"
$AddServerLabel.AutoSize        = $true
$AddServerLabel.width           = 25
$AddServerLabel.height          = 10
$AddServerLabel.location        = New-Object System.Drawing.Point(10,50)
$AddServerLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for entering IP addresses
$AddServerTextBox                 = New-Object system.Windows.Forms.TextBox
$AddServerTextBox.text            = ""
$AddServerTextBox.multiline       = $false
$AddServerTextBox.width           = 460
$AddServerTextBox.height          = 20
$AddServerTextBox.location        = New-Object System.Drawing.Point(15,85)
$AddServerTextBox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#opens SSH on a selected host
$AddServerButton              = New-Object system.Windows.Forms.Button
$AddServerButton.text         = "Add Host"
$AddServerButton.width        = 154
$AddServerButton.height       = 30
$AddServerButton.location     = New-Object System.Drawing.Point(600,425)
$AddServerButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$AddServerButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$AddServerButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$AddServerButton.Autosize     = $true

#label for adding usernames textbox
$AddServerUserNameLabel                 = New-Object system.Windows.Forms.Label
$AddServerUserNameLabel.text            = "UserName"
$AddServerUserNameLabel.AutoSize        = $true
$AddServerUserNameLabel.width           = 25
$AddServerUserNameLabel.height          = 10
$AddServerUserNameLabel.location        = New-Object System.Drawing.Point(10,120)
$AddServerUserNameLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for entering usernames
$AddServerUserNameTextBox                 = New-Object system.Windows.Forms.TextBox
$AddServerUserNameTextBox.text            = ""
$AddServerUserNameTextBox.multiline       = $false
$AddServerUserNameTextBox.width           = 460
$AddServerUserNameTextBox.height          = 20
$AddServerUserNameTextBox.location        = New-Object System.Drawing.Point(15,155)
$AddServerUserNameTextBox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


#label for password text box
$AddServerPasswordLabel                 = New-Object system.Windows.Forms.Label
$AddServerPasswordLabel.text            = "Password"
$AddServerPasswordLabel.AutoSize        = $true
$AddServerPasswordLabel.width           = 25
$AddServerPasswordLabel.height          = 10
$AddServerPasswordLabel.location        = New-Object System.Drawing.Point(10,190)
$AddServerPasswordLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for passwords
$AddServerPasswordTextBox                 = New-Object system.Windows.Forms.TextBox
$AddServerPasswordTextBox.text            = ""
$AddServerPasswordTextBox.multiline       = $false
$AddServerPasswordTextBox.width           = 460
$AddServerPasswordTextBox.height          = 20
$AddServerPasswordTextBox.location        = New-Object System.Drawing.Point(15,225)
$AddServerPasswordTextBox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#Text box for entering IP addresses
$AddServerTextBox                 = New-Object system.Windows.Forms.TextBox
$AddServerTextBox.text            = ""
$AddServerTextBox.multiline       = $false
$AddServerTextBox.width           = 460
$AddServerTextBox.height          = 20
$AddServerTextBox.location        = New-Object System.Drawing.Point(15,85)
$AddServerTextBox.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

#opens adds the info to the csv
$AddServerButton              = New-Object system.Windows.Forms.Button
$AddServerButton.text         = "Add Host"
$AddServerButton.width        = 154
$AddServerButton.height       = 30
$AddServerButton.location     = New-Object System.Drawing.Point(475,285)
$AddServerButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$AddServerButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$AddServerButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$AddServerButton.Autosize     = $true


#button to close the add server window
$AddServerCloseWindowButton              = New-Object system.Windows.Forms.Button
$AddServerCloseWindowButton.text         = "Close Window"
$AddServerCloseWindowButton.width        = 154
$AddServerCloseWindowButton.height       = 30
$AddServerCloseWindowButton.location     = New-Object System.Drawing.Point(475,325)
$AddServerCloseWindowButton.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$AddServerCloseWindowButton.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$AddServerCloseWindowButton.BackColor    = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")
$AddServerCloseWindowButton.Autosize     = $true



#adds objects to AddHost form
$AddServerForm.controls.AddRange(@($AddServerLabel,$AddServerTextBox,$AddServerButton,$AddServerUserNameLabel,$AddServerUserNameTextBox, $AddServerPasswordLabel, $AddServerPasswordTextBox,$AddServerCloseWindowButton))

#events from the AddHost form
$AddServerButton.Add_Click({ AddServerButtonClick })
$AddServerCloseWindowButton.Add_Click({ [void]$AddServerForm.Close() })




#################################

#functions for objects 


#functions for the main form 

#populates the dashboard with the refresh button
function MainButtonRefreshDashboardClick {
    #populates host ip values
    $data = (Get-Content -path "$PSScriptRoot\dashboard1.txt")
    $MainDashboardHostIPTextbox1.text = "$data"

    $data = (Get-Content -path "$PSScriptRoot\dashboard2.txt")
    $MainDashboardHostIPTextbox2.text = "$data"

    $data = (Get-Content -path "$PSScriptRoot\dashboard3.txt")
    $MainDashboardHostIPTextbox3.text = "$data"

    $data = (Get-Content -path "$PSScriptRoot\dashboard4.txt")
    $MainDashboardHostIPTextbox4.text = "$data"


    #populates timestamps
    #first gets the username and password from the IP address located on MainDashboardHostIPTextbox1 from sessions.csv
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox1.text)
    $ip = $MainDashboardHostIPTextbox1.text
    $username = $sessions.Username
    $password = $sessions.Password
    #command gets the date in hour, minute, second format
    $command = "Get-Date -Format ""HH:mm:ss"""
    #imports the csv with the information from servers.csv 
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    #sends a plink command through the server to query the managed host
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    #populates the textbox value with the output of the command
    $MainDashboardTimestampTextbox1.text = "$data"

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox2.text)
    $ip = $MainDashboardHostIPTextbox2.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Get-Date -Format ""HH:mm:ss"""
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardTimestampTextbox2.text = "$data"

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox3.text)
    $ip = $MainDashboardHostIPTextbox3.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Get-Date -Format ""HH:mm:ss"""
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardTimestampTextbox3.text = "$data"

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox4.text)
    $ip = $MainDashboardHostIPTextbox4.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Get-Date -Format ""HH:mm:ss"""
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardTimestampTextbox4.text = "$data"

    
    #populates ssh port availability check
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox1.text)
    $ip = $MainDashboardHostIPTextbox1.text
    $username = $sessions.Username
    $password = $sessions.Password
    #the command tests the availability of port 22 using tcp
    $command = "Test`-NetConnection `-ComputerName $ip `-Port 22 `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    #if the conneciton was successful, the textbox gets the value "Good"
    #if the connection failes, the textbox gets the value "Bad"
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardPort22Textbox1.text = "Good"
    }
    else {
        $MainDashboardPort22Textbox1.text = "Bad"
    }
    
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox2.text)
    $ip = $MainDashboardHostIPTextbox2.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Test`-NetConnection `-ComputerName $ip `-Port 22 `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardPort22Textbox2.text = "Good"
    }
    else {
        $MainDashboardPort22Textbox2.text = "Bad"
    }

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox3.text)
    $ip = $MainDashboardHostIPTextbox3.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Test`-NetConnection `-ComputerName $ip `-Port 22 `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardPort22Textbox3.text = "Good"
    }
    else {
        $MainDashboardPort22Textbox3.text = "Bad"
    }

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox4.text)
    $ip = $MainDashboardHostIPTextbox4.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Test`-NetConnection `-ComputerName $ip `-Port 22 `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardPort22Textbox4.text = "Good"
    }
    else {
        $MainDashboardPort22Textbox4.text = "Bad"
    }


    #populates rdp port availability check
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox1.text)
    $ip = $MainDashboardHostIPTextbox1.text
    $username = $sessions.Username
    $password = $sessions.Password
    #the command tests the availability of port 3389 using tcp
    $command = "Test`-NetConnection `-ComputerName $ip `-Port 3389 `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardPort3389Textbox1.text = "Good"
    }
    else {
        $MainDashboardPort3389Textbox1.text = "Bad"
    }

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox2.text)
    $ip = $MainDashboardHostIPTextbox2.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Test`-NetConnection `-ComputerName $ip `-Port 3389 `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardPort3389Textbox2.text = "Good"
    }
    else {
        $MainDashboardPort3389Textbox2.text = "Bad"
    }

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox3.text)
    $ip = $MainDashboardHostIPTextbox3.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Test`-NetConnection `-ComputerName $ip `-Port 3389 `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardPort3389Textbox3.text = "Good"
    }
    else {
        $MainDashboardPort3389Textbox3.text = "Bad"
    }

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox4.text)
    $ip = $MainDashboardHostIPTextbox4.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Test`-NetConnection `-ComputerName $ip `-Port 3389 `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardPort3389Textbox4.text = "Good"
    }
    else {
        $MainDashboardPort3389Textbox4.text = "Bad"
    }


    #populates icmp availability check
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox1.text)
    $ip = $MainDashboardHostIPTextbox1.text
    $username = $sessions.Username
    $password = $sessions.Password
    #the command tests the availability using ICMP traffic
    $command = "Test`-NetConnection `-ComputerName $ip `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardICMPTextbox1.text = "Good"
    }
    else {
        $MainDashboardICMPTextbox1.text = "Bad"
    }

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox2.text)
    $ip = $MainDashboardHostIPTextbox2.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Test`-NetConnection `-ComputerName $ip `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardICMPTextbox2.text = "Good"
    }
    else {
        $MainDashboardICMPTextbox2.text = "Bad"
    }

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox3.text)
    $ip = $MainDashboardHostIPTextbox3.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Test`-NetConnection `-ComputerName $ip `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardICMPTextbox3.text = "Good"
    }
    else {
        $MainDashboardICMPTextbox3.text = "Bad"
    }

    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox4.text)
    $ip = $MainDashboardHostIPTextbox4.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "Test`-NetConnection `-ComputerName $ip `-InformationLevel Quiet"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    if ($data -eq $True){
        $MainDashboardICMPTextbox4.text = "Good"
    }
    else {
        $MainDashboardICMPTextbox4.text = "Bad"
    }



    #populates cpu usage
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox1.text)
    $ip = $MainDashboardHostIPTextbox1.text
    $username = $sessions.Username
    $password = $sessions.Password
    #runs the cpu.ps1 file on the managed host
    #the file gets the current cpu utilization percentage
    $command = "cd C:\Capstone; powershell .\cpu.ps1"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardCPUTextbox1.text = $data


    #populates cpu usage
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox2.text)
    $ip = $MainDashboardHostIPTextbox2.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "cd C:\Capstone; powershell .\cpu.ps1"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardCPUTextbox2.text = $data


    #populates cpu usage
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox3.text)
    $ip = $MainDashboardHostIPTextbox3.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "cd C:\Capstone; powershell .\cpu.ps1"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardCPUTextbox3.text = $data


    #populates cpu usage
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox4.text)
    $ip = $MainDashboardHostIPTextbox4.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "cd C:\Capstone; powershell .\cpu.ps1"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardCPUTextbox4.text = $data



    #populates ram usage
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox1.text)
    $ip = $MainDashboardHostIPTextbox1.text
    $username = $sessions.Username
    $password = $sessions.Password
    #runs the ram.ps1 file on the managed host
    #the file gets the current ram utilization percentage
    $command = "cd C:\Capstone; powershell .\ram.ps1"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardRAMTextbox1.text = $data


    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox2.text)
    $ip = $MainDashboardHostIPTextbox2.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "cd C:\Capstone; powershell .\ram.ps1"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardRAMTextbox2.text = $data


    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox3.text)
    $ip = $MainDashboardHostIPTextbox3.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "cd C:\Capstone; powershell .\ram.ps1"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardRAMTextbox3.text = $data


    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainDashboardHostIPTextbox4.text)
    $ip = $MainDashboardHostIPTextbox4.text
    $username = $sessions.Username
    $password = $sessions.Password
    $command = "cd C:\Capstone; powershell .\ram.ps1"
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    $data = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    $MainDashboardRAMTextbox4.text = $data

}


#function to open rdp session
function MainButtonOpenRDPClick {
    #imports sessions.csv for the target hosts IP
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainComboboxSelectEndPoint.selecteditem)

    $ip = $MainComboboxSelectEndPoint.selecteditem

    #imports servers.csv to get the server's credentials and IP
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password

    #creates script for port forwaring ssh tunnel to rdp to selected host
    "plink -v -x -a -T -C -noagent -ssh -batch -pw $server_password -L 4444" + ':' + "$ip" + ':' + "3389 $server_username@$server_ip" | Out-File -FilePath "$PSScriptRoot\rdp_script.ps1"
   
    #runs the script to do port forwading
    cd $PSScriptRoot
    start powershell {.\rdp_script.ps1}
    
    #opens rdp
    #because of port forwarding, 127.0.0.1:4444 is the target managed host
    #close the powershell session with the ssh port forwarding to remove the port forwarding
    mstsc /v:127.0.0.1:4444

}



#Functions for the Process List Form

#function to generate process list
function MainButtonOpenProcessesClick {
    #imports sessions.csv to get the IP address and authentication information for the managed host
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainComboboxSelectEndPoint.selecteditem)
    $ip = $MainComboboxSelectEndPoint.selecteditem
    $username = $sessions.Username
    $password = $sessions.Password

    #imports servers.csv to get the IP address and authentication information for the managed host
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password

    #runs the tasklist.ps1 script on the host
    #this gets the output from get-process and organizes it 
    $command =  "cd C:\Capstone; powershell .\tasklist.ps1"
    plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command"

    #gets the tasklist output in a csv file
    $command =  "cd C:\Capstone; powershell more C:\Capstone\test_tasklist.csv"
    plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command" | out-file $PSScriptRoot/tasklist.csv

    #puts data from the csv in a data-table
    $task_list_array = new-object System.Collections.ArrayList
    $tasklist = Import-Csv "$PSScriptRoot\tasklist.csv"
    $task_list_array.AddRange($tasklist)
    $ProcessListDataGridView.DataSource = $task_list_array
    [void]$ProcessListForm.ShowDialog() 
 }

#Function to stop processes
function ProcessListStopProcessClick{
    #$dataGridView.CurrentCell.RowIndex
    #gets a row number selected
    #$TerminalInputTextbox.text = $ProcessListDataGridView.CurrentCell.RowIndex

    $row_index = $ProcessListDataGridView.CurrentCell.RowIndex

    #$TerminalInputTextbox.text = $ProcessListDataGridView.Rows[$row_index].Cells[1].value
    $selected_pid = $ProcessListDataGridView.Rows[$row_index].Cells[1].value
    
    #command stops the selected processes from the data grid view
    $command = "kill $selected_pid"
    
    #imports the host information from sessions.csv 
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainComboboxSelectEndPoint.selecteditem)
    $ip = $MainComboboxSelectEndPoint.selecteditem
    $username = $sessions.Username
    $password = $sessions.Password

    #imports the server information from sessions.csv
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password
    
    #performs the plink command sending it from the management console, to the server, to the managed host
    plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command"


    #reloading the tasklist
    $command =  "cd C:\Capstone; powershell .\tasklist.ps1"
    plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command"

    #gets the tasklist output in a csv file
    $command =  "cd C:\Capstone; powershell more C:\Capstone\test_tasklist.csv"
    plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command" | out-file $PSScriptRoot/tasklist.csv

    #puts in a data-table
    $task_list_array = new-object System.Collections.ArrayList
    $tasklist = Import-Csv "$PSScriptRoot\tasklist.csv"
    $task_list_array.AddRange($tasklist)
    $ProcessListDataGridView.DataSource = $task_list_array
    [void]$ProcessListForm.ShowDialog() 
} 

 

#Functions for AddHostForm
function AddHostButtonClick{
    $EnteredIP = $AddHostTextBox.text
    
    #adds the entered IP address to the select endpoint combobox, the list of managed hosts
    @($EnteredIP) | ForEach-Object {[void] $MainComboboxSelectEndPoint.Items.Add($_)}
    
    $EnteredUsername = $AddHostUserNameTextBox.text
    $EnteredPassword = $AddHostPasswordTextBox.text
    
    #puts the entered information into the csv
    #every time the program starts, it populates the select endpoint combobox from this csv
    $exists = (Test-Path -Path "$PSScriptRoot\sessions.csv" -PathType Leaf)
    if ($exists -eq $False)
        {
            Add-Content -Path "$PSScriptRoot\sessions.csv" -Value '"IP_Address","Username","Password"'
        }

    $sessions = @(
    "$EnteredIP, $EnteredUsername, $EnteredPassword"
    )
    $sessions | foreach { Add-Content -Path  "$PSScriptRoot\sessions.csv" -Value $_ }

    #once the values have been saved, the textboxes values are reset
    $AddHostTextBox.text = ""
    $AddHostUserNameTextBox.text = ""
    $AddHostPasswordTextBox.text = ""
 }


#Functions for TerminalWindow Form
function TerminalInputButtonClick{
    #imports host info from csv
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainComboboxSelectEndPoint.selecteditem)
    $ip = $MainComboboxSelectEndPoint.selecteditem
    $username = $sessions.Username
    $password = $sessions.Password

    #imports server info from csv
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password

    #passes the contents of the TerminalInputTextbox.text as a command to the host
    #the output is stored in command_output.csv
    #the output csv is used to populate a data grid view with the contents
    plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch" powershell $TerminalInputTextbox.text | Out-File $PSScriptRoot/command_output.csv
    $command_output_array = new-object System.Collections.ArrayList
    $command_output = Import-Csv "$PSScriptRoot\command_output.csv"
    $command_output_array.AddRange($command_output)
    $TerminalOutputDataGridView.DataSource = $command_output_array

    $TerminalInputTextbox.text = ""

}



#Functions for task list form

#functions for packet capture form
function PacketCaptureAddAdapterButtonClick{
    #gets client info from the csv
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainComboboxSelectEndPoint.selecteditem)
    $ip = $MainComboboxSelectEndPoint.selecteditem
    $username = $sessions.Username
    $password = $sessions.Password

    #gets server info from the csv
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password

    #sets the label so you know which computer the adapters are from
    $PacketCaptureSelectAdapterLabel.text = "Select Network Adapter: $ip"
    
    #runs the NetworkAdapters.ps1 script on the host. It gets a listof Network adapters
    $command =  "cd C:\Capstone; powershell ./NetworkAdapters.ps1"
    $output = (plink.exe $server_username@$server_ip -pw $server_password -batch "plink.exe $username@$ip -pw $password -batch powershell $command")
    @($output) | ForEach-Object {[void] $PacketCaptureSelectAdapterComboBox.Items.Add($_)}
}


#function to set file location
Function PacketCaptureWriteLocationButtonClick
{
    #creates a button that can select a storage location on the management console computer
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null
    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory
    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    $result = $folder
    #the selected location is stored on the textbox
    $PacketCaptureLocalLocationTextbox.text = $result
}


Function PacketCaptureStartButtonClick
{
    #gets client info from the csv
    $sessions = Import-Csv "$PSScriptRoot\sessions.csv"
    $sessions = ($sessions | Where-Object IP_Address -eq $MainComboboxSelectEndPoint.selecteditem)
    $ip = $MainComboboxSelectEndPoint.selecteditem
    $username = $sessions.Username
    $password = $sessions.Password

    #gets server info from the csv
    $servers = Import-Csv "$PSScriptRoot\servers.csv"
    $servers = ($servers | Where-Object IP_Address -eq $MainComboboxSelectServer.selecteditem)
    $server_ip = $MainComboboxSelectServer.selecteditem
    $server_username = $servers.Username
    $server_password = $servers.Password

    #sets variables to pass as parameters from the values in the packet capture form
    $1 = $PacketCaptureSelectAdapterComboBox.selecteditem 
    $2 = $PacketCaptureSizeTextbox.text 
    $3 = $PacketCaptureDurationTextbox.text
    $4 = $PacketCaptureWriteLocationTextbox.text
    $5 = $PacketCaptureLocalLocationTextbox.text
    #reformats the contents of $4 to be used with pscp
    $regex = $PacketCaptureWriteLocationTextbox.text -replace '[\\]', '/' 

    cd $PSScriptRoot
    #creates a file to send commands to the host to perform a packet capture and stores it on the server
    "`$command = ""cd C:\Capstone; powershell -f 'PacketCapture2.ps1' $1 $2 $3 $4"" `nplink.exe $server_username@$server_ip -pw $server_password -batch ""plink.exe $username@$ip -pw $password -batch powershell `$command"" `n`$command = ""pscp -pw $password $username@$ip`:$regex C:\Capstone\$ip.pcap"" `nplink.exe $server_username@$server_ip -pw $server_password -batch powershell `$command " | Out-File -FilePath "$PSScriptRoot\PacketCapture.ps1" 
    #runs the created file
    start PowerShell {.\PacketCapture.ps1}
    #gets the packet capture from the server
    pscp -pw $server_password $server_username@$server_ip`:C:/Capstone/$ip.pcap $5\$ip.pcap
}



#functions for editing the dashboard
function EditDashboardAddHostButton1Click {
    $SelectedHost = $EditDashboardComboboxSelectEndPoint1.SelectedItem
    
    #sets the IP address of the host for the dashboard row 1
    $exists = (Test-Path -Path "$PSScriptRoot\dashboard1.txt" -PathType Leaf)
    if ($exists -eq $True)
        {
            del $PSScriptRoot\dashboard1.txt
        }
    Add-Content -Path "$PSScriptRoot\dashboard1.txt" -Value "$SelectedHost"
    $data = (Get-Content -path "$PSScriptRoot\dashboard1.txt")
    $EditDashboardTextbox1.text            = "$data"
}


function EditDashboardAddHostButton2Click {
    $SelectedHost = $EditDashboardComboboxSelectEndPoint2.SelectedItem
    
    #sets the IP address of the host for the dashboard row 2
    $exists = (Test-Path -Path "$PSScriptRoot\dashboard2.txt" -PathType Leaf)
    if ($exists -eq $True)
        {
            del $PSScriptRoot\dashboard2.txt
        }
    Add-Content -Path "$PSScriptRoot\dashboard2.txt" -Value "$SelectedHost"
    $data = (Get-Content -path "$PSScriptRoot\dashboard2.txt")
    $EditDashboardTextbox2.text            = "$data"
}


function EditDashboardAddHostButton3Click {
    $SelectedHost = $EditDashboardComboboxSelectEndPoint3.SelectedItem
    
    #sets the IP address of the host for the dashboard row 3
    $exists = (Test-Path -Path "$PSScriptRoot\dashboard3.txt" -PathType Leaf)
    if ($exists -eq $True)
        {
            del $PSScriptRoot\dashboard3.txt
        }
    Add-Content -Path "$PSScriptRoot\dashboard3.txt" -Value "$SelectedHost"
    $data = (Get-Content -path "$PSScriptRoot\dashboard3.txt")
    $EditDashboardTextbox3.text            = "$data"
}


function EditDashboardAddHostButton4Click {
    $SelectedHost = $EditDashboardComboboxSelectEndPoint4.SelectedItem
    
    #sets the IP address of the host for the dashboard row 4
    $exists = (Test-Path -Path "$PSScriptRoot\dashboard4.txt" -PathType Leaf)
    if ($exists -eq $True)
        {
            del $PSScriptRoot\dashboard4.txt
        }
    Add-Content -Path "$PSScriptRoot\dashboard4.txt" -Value "$SelectedHost"
    $data = (Get-Content -path "$PSScriptRoot\dashboard4.txt")
    $EditDashboardTextbox4.text            = "$data"
}



#functions for add server button click
function AddServerButtonClick {
    $EnteredIP = $AddServerTextBox.text

    #populates the select server combobox with the server from the AddServerTextbox
    @($EnteredIP) | ForEach-Object {[void] $MainComboboxSelectServer.Items.Add($_)}
    
    $EnteredUsername = $AddServerUserNameTextBox.text
    $EnteredPassword = $AddServerUserNameTextBox.text
    
    #puts the values from the from in a csv
    #when the program starts, it populates the select server combobox using this csv
    $exists = (Test-Path -Path "$PSScriptRoot\servers.csv" -PathType Leaf)
    if ($exists -eq $False)
        {
            Add-Content -Path "$PSScriptRoot\servers.csv" -Value '"IP_Address","Username","Password"'
        }

    $sessions = @(
    "$EnteredIP, $EnteredUsername, $EnteredPassword"
    )
    $sessions | foreach { Add-Content -Path  "$PSScriptRoot\servers.csv" -Value $_ }

    #resets the values of the textboxes once the values have been saved
    $AddServerTextBox.text = ""
    $AddServerUserNameTextBox.text = ""
    $AddServerUserNameTextBox.text = ""
 }


#the remove host button doesn't currently work. You can remove them by directly editing the sessions.csv, located in the same directory as the main.ps1 file.
function MainButtonRemoveHostClick { 
    $sessions = (Import-Csv "$PSScriptRoot\sessions.csv")
    $sessions = (where IP_Address -NotLike $MainComboboxSelectEndPoint.selecteditem)
    $sessions | Export-Csv "$PSScriptRoot\sessions.csv"
}




################################

#prints the GUI
[void]$mainForm.ShowDialog()
