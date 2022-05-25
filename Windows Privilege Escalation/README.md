priv.ps1 is a quick privilege escalation enumeration script that uses commands I found myself frequently using 
in capture the flag events for Windows privilege escalation.

Use:

1. Download priv.ps1 or copy into a text editor directly.
2. Move to the target Windows or Microsoft Server endpoint to allow running the file locally on the target.
3. Check the user execution policy for PowerShell scripts: Get-ExecutionPolicy -List
4. If the current user isn't able to run script use: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
5. From a PowerShell prompt you can enter: ./priv.ps1 or from a cmd prompt you can enter: powershell -c "priv.ps1"
