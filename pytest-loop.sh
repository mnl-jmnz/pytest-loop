# get newest file
# $tm will contain newest file time stamp
# $name will contain newest file name
function get_newest_file() {
	find=$(find . -type f -print0 | xargs -0 stat -f "%m %N" | sort -rn | head -1)
	tm=$(echo "$find" | cut -d' ' -f1)
	name=$(echo "$find" | cut -d' ' -f2)
}

last_tm=0

LIGHT_GRAY='\033[0;37m'
NO_COLOR='\033[0m' # No Color

# start endless loop
while true; do
	# get newest file
	get_newest_file
	if [ $last_tm -lt $tm ];
	# some file has been modifed
	then
		if [ $last_tm != 0 ];
		# it's not the first time
		then
			# prompt newest file name
			echo "${LIGHT_GRAY}File \""$name"\" modified${NO_COLOR}"
			if [ "$name" == "$0" ];
			# modified file is this script
			then
				# restart script
				echo "${LIGHT_GRAY}Re-run script!${NO_COLOR}"
				./$(basename $0) && exit
			fi
		fi
		# update last file timestamp
		last_tm=$tm
		python manage.py test
	# no file modified
	else
		# while for one second, then run loop again
		sleep 1
	fi
done
