if [ "$MENUCMD" ] && [ -z "${inp:=$1}" ]
then
	inp="$($MENUCMD < /dev/null)"
else
	echo "input:" >&2
	read inp
fi
test -z "$inp" &&
	exit 1
