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


if [ $USER != 'root' ]; then
   printf "${RED}You must be root to do this. \n" 1>&2
   exit 100
fi
if [  -n "$(uname -a | grep -iE 'Ubuntu|Debian')" ]; then
    sudo apt update && sudo apt upgrade -y
    sudo apt install nginx mysql-server php7 php7-fpm php7-mysql -y
    sudo systemctl enable mysql.service
    sudo systemctl start mysql.service
    sudo mysql_secure_installation

else
   sudo yum update -y	
   sudo yum install epel-release -y
   sudo yum install nginx -y
   sudo systemctl enable nginx	
   sudo systemctl start nginx
   sudo yum install yum-utils -y
   sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
   sudo yum-config-manager --enable remi-php74
   sudo yum install php74-php php74-php-fpm php74-php-gd php74-php-json php74-php-mbstring php74-php-mysqlnd php74-php-xml php74-php-xmlrpc php74-php-opcache -y
   sudo systemctl enable php74-php-fpm	
   sudo systemctl start php74-php-fpm
   sudo wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
   sudo rpm -Uvh mysql80-community-release-el7-3.noarch.rpm
   sudo yum install mysql-server -y
   sudo systemctl enable mysqld
   sudo systemctl start mysqld
   sudo grep 'password' /var/log/mysqld.log
   sudo mysql_secure_installation
fi
