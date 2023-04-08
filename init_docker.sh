#!/bin/sh

apt-get update
apt-get install -y build-essential make sudo pip git
apt-get install -y verilator gtkwave vim x11-apps ghostscript python3-tk dbus-x11
apt-get install -y gcc-riscv64-unknown-elf srecord
pip install fusesoc 

apt-get install libstdc++6
apt-get install libgtk2.0-0
apt-get install dpkg-dev
sudo ln -s /usr/bin/make /usr/bin/gmake
apt install libtinfo5 libncurses5
apt-get clean && apt-get update
apt-get install locales
locale-gen en_US.UTF-8

apt-get install libxtst6
apt-get install -y lib32stdc++6 libgtk2.0-0:i386 libfontconfig1:i386 libx11-6:i386 libxext6:i386 libxrender1:i386 libsm6:i386  xinetd  iproute2  gawk  gcc  net-tools  ncurses-dev  openssl  libssl-dev  flex  bison  xterm  autoconf  libtool  texinfo  zlib1g-dev  gcc-multilib  build-essential  automake  screen  putty  pax  g++  python3-pip  xz-utils  python3-git  python3-jinja2  python3-pexpect  debianutils  iputils-ping  libegl1-mesa  libsdl1.2-dev   python3  cpio  tftpd-hpa  gnupg  zlib1g:i386 haveged perl liberror-perl mtd-utils xtrans-dev libxcb-randr0-dev  libxcb-xtest0-dev  libxcb-xinerama0-dev  libxcb-shape0-dev  libxcb-xkb-dev openssh-server util-linux sysvinit-utils google-perftools
apt install --reinstall libgl1-mesa-dri
