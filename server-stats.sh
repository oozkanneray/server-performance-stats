echo "-----CPU USAGE--------"
top -bn1 | grep "Cpu(s):" | cut -d "," -f 4 | awk '{print "CPU Usage: " 100-$1 "%"}'
echo "----MEMORY USAGE------"
free -h --si  | awk ' /Mem:/ {printf "RAM Used: %s / Total: %s (%.2f%%)\n",$3,$2,$5}'
echo "----DISK USAGE-----"
df -h --total | awk '/total/ {print "Used: "$3 "\nFree: "$4 "\nTotal:"$5}'
echo "---TOP 5 CPU USAGE-------"
ps aux --sort %cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'
echo "---TOP 5 MEMORY USAGE----"
ps aux --sort %mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'
