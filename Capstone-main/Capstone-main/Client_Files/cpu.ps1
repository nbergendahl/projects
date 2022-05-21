$cpu_usage = (Get-WmiObject -computer 127.0.0.1 -class win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average)
$cpu_usage = "$cpu_usage" + '%'
echo $cpu_usage
