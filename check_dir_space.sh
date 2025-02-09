#!/bin/bash

read -p "Write directories to check separated by spaces: " MY_DIRECTORIES

if [[ -z $MY_DIRECTORIES ]]; then
	MY_DIRECTORIES="."
fi

echo "Top Ten Disk Space Usage"
for DIR in $MY_DIRECTORIES
do
	echo "The $DIR Directory:"
	du -S -h $DIR 2>/dev/null | sort -rh | head -10
done
