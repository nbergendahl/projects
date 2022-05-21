$total_mem = (Get-WmiObject win32_OperatingSystem |%{"{0}" -f $_.totalvisiblememorysize})
$free_mem = (Get-WmiObject win32_OperatingSystem |%{"{0}" -f $_.freephysicalmemory})
$percent_mem = $free_mem / $total_mem
$percent_mem = $percent_mem * 100
$percent_mem = ([math]::Round($percent_mem,2))
$percent_mem = 100 - $percent_mem
$percent_mem = "$percent_mem" + '%'
echo $percent_mem
