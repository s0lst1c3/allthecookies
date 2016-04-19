#!/bin/bash

SCRIPT_DIR='cookie_stealers';

NO_REDIRECT='no-redirect.py';
WITH_REDIRECT='with-redirect.py';
WITH_AJAX='with-ajax.py';

if [ "$(id -u)" != "0" ]; then
   echo "Run me as root please." 1>&2
   exit 1
fi

cat << "EOF"

Assorted Cookie Stealers.
Written by Gabriel Ryan for XSS-SESSION-HIJACKING blogpost at

	http://solstice.me
EOF

menu=$(cat << "EOF"

Launch cookie stealer with

	1. No Redirect
	2. With Redirect
	3. With AJAX Support

EOF
)


lolsauce="0";
runfile='';
while [ $lolsauce==$lolsauce ]; do


	echo "$menu"
	echo ""

    read -p 'Please enter option 1, 2, or 3: ' lolsauce;

    if [ $lolsauce == "1" ]; then
		
		runfile="$SCRIPT_DIR/$NO_REDIRECT"
        break

    elif [ $lolsauce == "2" ]; then

		runfile="$SCRIPT_DIR/$WITH_REDIRECT"
        break

    elif [ $lolsauce == "3" ]; then

		runfile="$SCRIPT_DIR/$WITH_AJAX"
        break

    fi

    echo "Please select a valid option.";
done

echo "Launching $runfile..."
python "$runfile"

