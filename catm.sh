if [ $# -eq 0 ]
then
	echo "catm: Enter at least one filename"
fi

IFS=$'\\'

for file in $*
do
	if [ -f $file ]
	then	
		echo
		echo "====================================="
		if [ -h $file ]	
		then
			linkedToFile=$(readlink $file)
			echo FILENAME: \"$file\" "->" \"$linkedToFile\"
		else
			echo FILENAME: \"$file\"
		fi
		echo "<<<START OF FILE>>>"
	fi
	cat $file | more
	if [ -f $file ] || [ -h $file ]   # Explicitly checking for symbolic link to be safe
	then
		echo "<<<END OF FILE>>>"
		echo "====================================="
		echo
	fi
done

