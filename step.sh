#!/bin/bash

if [ -z "${long_url}" ]; then
	printf "\e[31mNo long_url specified\e[0m\n"
	exit 1
fi

echo
echo " * Long url is : ${long_url}"

short_url=$(curl -s http://tinyurl.com/ap.i-create.php?url=${long_url})

if [[ "${short_url}" != "" ]] ; then
	echo 'Exporting short url: $SHORTEN_URL =>' "${short_url}"
	envman add --key "SHORTEN_URL" --value "${short_url}"
else
	echo "Error while shortening url :("
fi