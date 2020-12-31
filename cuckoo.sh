# Note : this installations for Debian or Ubuntu Distributions only
# Python version : Python2

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

sudo adduser cuckoo
sudo usermod -a -G vboxusers cuckoo
sudo usermod -a -G libvirtd cuckoo

sudo apt install python2 python2-pip python2-dev libffi-dev libssl-dev
sudo apt install python2-virtualenv python2-setuptools
sudo apt install libjpeg-dev zlib1g-dev swig

sudo apt-get install postgresql libpq-dev

sudo apt install tcpdump apparmor-utils
sudo aa-disable /usr/sbin/tcpdump
sudo groupadd pcap
sudo usermod -a -G pcap cuckoo
sudo chgrp pcap /usr/sbin/tcpdump
sudo apt install libcap2-bin

sudo apt install swig
sudo python2 -m pip install m2crypto==0.24.0
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump

sudo apt install libguac-client-rdp0 libguac-client-vnc0 libguac-client-ssh0 guacd

python2 -m virtualenv env
source env/bin/activate

python2 -m pip install -U cuckoo
