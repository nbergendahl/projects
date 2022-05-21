$taskobjects = get-process | select Name,ID,Description,WS
$tasklist = New-Object System.Collections.ArrayList
$tasklist.AddRange($taskobjects)

#echo $tasklist | Out-File -FilePath "$PSScriptRoot\test_tasklist.csv"
#doesn't work

#(Get-Content test_tasklist.csv | Select-Object -skip 1) | Set-Content test_tasklist.csv

$exists = (Test-Path -Path "C:\Capstone\test_tasklist.csv" -PathType Leaf)
if ($exists -eq $True)
	{
		rm C:\Capstone\test_tasklist.csv 
	}

$tasklist | Export-Csv -Path C:\Capstone\test_tasklist.csv
