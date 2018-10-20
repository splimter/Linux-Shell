#!/bin/sh
repos="#extras repository\n
deb http://http.kali.org/kali kali-rolling main contrib non-free\n
deb-src http://http.kali.org/kali kali-rolling main contrib non-free\n
deb http://http.kali.org/kali sana main non-free contrib\n
deb http://security.kali.org/kali-security sana/updates main contrib non-free\n
deb-src http://http.kali.org/kali sana main non-free contrib\n
deb-src http://security.kali.org/kali-security sana/updates main contrib non-free\n
deb http://old.kali.org/kali moto main non-free contrib\n
deb-src http://old.kali.org/kali moto main non-free contrib
"

SublimeSerial="
\n
~~~~~~~~~Sublime3 3176~~~~~~~~~\n
----- BEGIN LICENSE -----\n
sgbteam \n
Single User License\n
EA7E-1153259\n
8891CBB9 F1513E4F 1A3405C1 A865D53F\n
115F202E 7B91AB2D 0D2A40ED 352B269B\n
76E84F0B CD69BFC7 59F2DFEF E267328F\n
215652A3 E88F9D8F 4C38E3BA 5B2DAAE4\n
969624E7 DC9CD4D5 717FB40C 1B9738CF\n
20B3C4F1 E917B5B3 87C38D9C ACCE7DD8\n
5F7EF854 86B9743C FADC04AA FB0DA5C0\n
F913BE58 42FEA319 F954EFDD AE881E0B\n
------ END LICENSE ------\n
~~~~~~~~~ END ~~~~~~~~~\n
"
help="\n
If you have a problem while execution one of those option\n
please fellow these steps:\n
1-open a terminal and write:\n
script SLog.txt\n
2-execute the shell:\n
./SPtlPro.sh\n
3-do the thing that you have did\n
4-in the end write:\n
exit\n
5-goto the folder and send the SLog.txt to me\n
or via email soheybemir@gmail.com\n
"

Hello="\n
~~~~~~~~~~~~~~~~\n
By: Splimter\n
Version: V4.0 (181020)\n
~~~~~~~~~~~~~~~~\n
"

echo $Hello

unziping(){
unzip shell-data.zip
touch make.dll
}

setupU(){
	lock
sudo apt-get update
sudo apt-get upgrade
sudo apt install ubuntu-restricted-extras
sudo apt-get install preload
}

setupK(){
	lock
if [ -f /etc/apt/splimterv1.repo ]; then
echo "Done before" 
else
echo $repos >> /etc/apt/sources.list
touch /etc/apt/splimterv1.repo
fi

sudo apt-get install preload
sudo apt-get update
sudo apt-get upgrade

}

lock(){
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo dpkg --configure -a
}

extraU(){
	lock

if [ -f shell-data/make.dll ]; then
echo "Done before" 
else
unziping
fi
cd shell-data
sudo dpkg -i aptitude_0.8.10-6ubuntu1_amd64.deb
sudo dpkg -i build-essential_12.4ubuntu1_amd64.deb
sudo dpkg -i flatpak_0.11.3-3_amd64.deb
sudo dpkg -i gnome-software-plugin-flatpak_3.28.1-0ubuntu4.18.04.4_amd64.deb
sudo dpkg -i tilix_1.7.7-1ubuntu2_amd64.deb
sudo dpkg -i g++_7.3.0-3ubuntu2_amd64.deb
sudo dpkg -i vim_8.0.1453-1ubuntu1_amd64.deb
sudo dpkg -i vim-gtk3_8.0.1453-1ubuntu1_amd64.deb
tar -xvjf sublime_text_3_build_3176_x64.tar.bz2
cd sublime_text_3
./configure
make
sudo make install
sudo apt-get -f install

sudo apt install aptitude
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub 
sudo apt install gcc
sudo apt install build-essential
sudo apt-get install g++
sudo apt install vim
sudo apt install vim-gtk3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

echo -e $SublimeSerial
}

extraK(){
	lock

if [ -f shell-data/make.dll ]; then
echo "Done before" 
else
unziping
fi
cd shell-data
sudo dpkg -i tilix_1.7.7-1ubuntu2_amd64.deb
sudo dpkg -i g++_7.3.0-3ubuntu2_amd64.deb
sudo dpkg -i vim_8.0.1453-1ubuntu1_amd64.deb
sudo dpkg -i vim-gtk3_8.0.1453-1ubuntu1_amd64.deb
tar -xvjf sublime_text_3_build_3176_x64.tar.bz2
cd sublime_text_3
./configure
make
sudo make install

sudo apt-get -f install

apt-get install git
apt-get install tilix
apt-get install maltego metasploit-framework burpsuite wireshark aircrack-ng hydra nmap beef-xss nikto
echo 'deb https://deb.torproject.org/torproject.org stretch main
deb-src https://deb.torproject.org/torproject.org stretch main' > /etc/apt/sources.list.d/tor.list
wget -O- 'https://pgp.mit.edu/pks/lookup?op=get&search=0xA3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89' | sudo apt-key add -
apt-get update
apt-get install tor deb.torproject.org-keyring
apt-get install gvfs gvfs-common gvfs-daemons gvfs-libs gconf-service gconf2 gconf2-common gvfs-bin psmisc

sudo apt-get install g++
sudo apt install vim
sudo apt install vim-gtk3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

echo -e $SublimeSerial
}

clr(){
sudo apt-get autoclean
sudo apt-get clean
sudo apt autoremove	
}

sysinfo(){
sudo apt install hardinfo
hardinfo | less
}

echo "
Network connection is needed\n
Please close all programme & Terminal\n 
press 0 for help
press 1 to finalize the Ubuntu instalation
press 11 to finalize the Kali instalation
press 2 to setup the Ubuntu extras
press 22 to setup the Kali extras
press 3 to view the systeln inforlation
press 4 to fix the lock folders
press ctrl+c to quit\n"

read op

if [ $op = 1 ]; then
    setupU
   elif [ $op = 11 ]; then
   	setupK
   elif [ $op = 2 ]; then
   	extraU
   	clr
   elif [ $op = 22 ]; then
   	extraK
   	clr
   elif [ $op = 3 ]; then
   	sysinfo
   elif [ $op = 4 ]; then
   	lock
   elif [ $op = 0 ]; then
   	echo $help
else
    echo "Wrong input -_-"
fi

