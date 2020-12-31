RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

if [[ $(id -u) -ne 0 ]] ; then echo -e "${RED}Please run as root" ; exit 1 ; fi
freebsd-update fetch install
pkg update && pkg upgrade -y
pkg install -y sudo vim bash curl

sudo pkg install -y apache24
sysrc apache24_enable=yes
service apache24 start

pkg install php72 php72-mysqli php72-mbstring php72-zlib php72-curl php72-gd php72-json
cd /usr/local/etc
cp php.ini-production php.ini

pkg install mysql80-server
sysrc mysql_enable=yes
service mysql-server start
mysql_secure_installation

