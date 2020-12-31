if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
( lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1 | awk '{print $1}'
