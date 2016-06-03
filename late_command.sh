#!/bin/bash

# passwordless sudo
echo "eab ALL=NOPASSWD: ALL" >> /etc/sudoers

# public ssh key for vagrant user
mkdir /home/eab/.ssh
wget -O /home/eab/.ssh/authorized_keys "https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub"
chmod 755 /home/eab/.ssh
chmod 644 /home/eab/.ssh/authorized_keys
chown -R eab:eab /home/eab/.ssh

# speed up ssh
echo "UseDNS no" >> /etc/ssh/sshd_config

# remove debian boot error "Driver pcspkr is already registered, aborting..."
echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist.conf

# display login promt after boot
sed "s/quiet splash//" /etc/default/grub > /tmp/grub
sed "s/GRUB_TIMEOUT=[0-9]/GRUB_TIMEOUT=1/" /tmp/grub > /etc/default/grub
update-grub

#######################################

apt-get install linux-headers-$(uname -r)

apt-get install -y zip

apt-get install -y git
apt-get install -y cmake

apt-get install -y libblas-dev liblapack-dev
apt-get install -y libblas3
apt-get install -y liblapack3
apt-get install -y libopenblas-dev
apt-get install -y libopenblas-base

apt-get install -y openmpi
apt-get install -y openmpi-bin
apt-get install -y mpich
apt-get install -y libopenmpi-dev

apt-get install -y libmetis-dev
apt-get install -y gfortran
apt-get install -y python-dev
apt-get install -y python-numpy
apt-get install -y python-scipy
apt-get install -y libreadline5
apt-get install -y libavcall
apt-get install -y libffcall1-dev
apt-get install -y libsigsegv-dev

wget http://192.168.0.107/share/www/maxima_5.36.0-1_amd64.deb
dpkg -i maxima_5.36.0-1_amd64.deb

mkdir -p /home/eab/data/src
cd /home/eab/data/src
wget http://192.168.0.107/share/www/petsc.zip
unzip petsc.zip

mkdir -p /home/eab/data/gitno/github/
cd /home/eab/data/gitno/github/
wget http://192.168.0.107/share/www/ahmed.zip
unzip ahmed.zip

chown -R eab:eab /home/eab/data

mkdir -p /home/eab/git/difwave
cd /home/eab/git/difwave
git clone https://github.com/boykov/abiem
chown -R eab:eab /home/eab/git

cd /home/eab/git/difwave/abiem
sudo -u eab make test

#######################################

# clean up
apt-get autoremove --yes
apt-get clean

# Zero free space to aid VM compression
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
