#!/bin/bash
echo "Отчет о системе"

os_version=$(cat /etc/os-release | grep PRETTY_NAME | sed 's/PRETTY_NAME=//')
echo "Версия операционной системы: $os_version"
echo "Дата: $current_date"
current_date=$(date '+%d.%m.%y')

echo "Время: $current_time"
current_time=$(date '+%H:%M:%S')

echo "Время работы системы: $uptime_info"
uptime_info=$(uptime -p)

echo "Загруженность системы: $system_load"
system_load=$(uptime | awk -F'[a-z]:' '{ print $2 }')

echo "Занятое дисковое пространство: $disk_usage'%'"
disk_usage=$(df / | awk '{print $5}' | sed 's/%//' | grep -v Use)

echo "Топ процессы по использованию памяти:"
top_processes=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6)

echo "$top_processes"
echo "Количество процессов: $process_count"
process_count=$(ps -ef | wc -l)

echo "Количество пользователей: $user_count"
user_count=$(who | wc -l)