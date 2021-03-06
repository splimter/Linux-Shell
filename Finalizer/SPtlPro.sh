#!/bin/bash
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

help="\n\nIf you have a problem while executing one of these options please fellow these steps:\n\n
1- open terminal and write:\n \t\t 
script SLog.txt\n
2-execute the shell:\n\t\t./SPtlPro.sh\n
3-do the thing that you have did\n
4-in the end write:\n\t\texit\n
5-goto the folder and send the SLog.txt to me via email\n\n \t\t ----------------------------------------\n
\t\t\t--------------------------\n\t\t\t-# soheybemir@gmail.com #- \n\t\t\t--------------------------\n
"

Hello="\n
~~~~~~~~~~~~~~~~\n
By: Splimter\n
Version: V5.0 (181103)\n
~~~~~~~~~~~~~~~~\n
"

warnning="\n
\t!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n
This is an extrem tweak to make the startup faster.\n
Use it at your won risk.\n
I'am not responisble for any damage that could happen.\n
Tested on Ubuntu Mate.\n
Just change the 90 into 10 & delete the #.\n
#DefaultTimeoutStartSec=90s\n
#DefaultTimeoutStopSec=90s \n
\t!!!!!!!!!!!!!!!!!!!!!!!!!!!!   \n       
          "

exttweak(){
  echo -e $warnning
  while true; do
    read -p "Do you wish to performe this tweak? " yn
    case $yn in
        [Yy]* )  sudo cp /etc/systemd/system.conf /etc/systemd/system.conf.bak && pluma /etc/systemd/system.conf; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

}

unziping(){
unzip shell-data.zip
cd shell-data
touch make.dll
}

setupU(){
	lock
echo "##### Progress 0% #####"
sudo apt-get update
echo "##### Progress 25% #####"
sudo apt-get upgrade 
echo "##### Progress 50% #####"
sudo apt install ubuntu-restricted-extras
echo "##### Progress 75% #####"
sudo apt-get install preload
echo "Done"
}

setupK(){
	echo "##### Progress 0 #####"
	lock
	echo "##### Progress 20% #####"
if [ -f /etc/apt/splimterv1.repo ]; then
echo "Done before" 
else
echo -e $repos >> /etc/apt/sources.list
touch /etc/apt/splimterv1.repo
fi
echo "##### Progress 40% #####"
sudo apt-get install preload
echo "##### Progress 60% #####"
sudo apt-get update
echo "##### Progress 80% #####"
sudo apt-get upgrade
echo "Done"

}

lock(){
sudo rm /var/cache/apt/archives/lock >> /dev/null
sudo rm /var/lib/dpkg/lock >> /dev/null
sudo dpkg --configure -a >> /dev/null
}

extraU(){
	lock

if [ -f shell-data/make.dll ]; then
echo  "##### Done before ##### "
else
unziping
fi

cd shell-data

if [ -f old.dll ]; then
echo "##### Done before ##### " 
else
touch old.dll
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
fi

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
}

extraK(){
	lock

if [ -f shell-data/make.dll ]; then
echo "Done before" 
else
unziping
fi

cd shell-data

if [ -f old.dll ]; then
echo "##### Done before ##### " 
else
touch old.dll
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
fi

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

echo -e $Hello

echo "   
  Network connection is needed Please close, all programme & Terminal
       -###########################- 

    Press 0 for help.
    Press 1 to finalize the Ubuntu instalation.
    Press 2 to finalize the Kali instalation.
    Press 3 to setup the Ubuntu extras.
    Press 4 to setup the Kali extras.
    Press 5 to view the systeln inforlation.
    Press 6 to fix the lock folders.
    Press 9 to Fast-Startup.
    Press ctrl+c to quit.
"

while true; do

  read -n1 -p "Chose an option: " op 

  if [ $op = 1 ]; then
    setupU
    break;
   elif [ $op = 2 ]; then
    setupK
    break;
   elif [ $op = 3 ]; then
    extraU
    clr
    break;
   elif [ $op = 4 ]; then
    extraK
    clr
    break;
   elif [ $op = 5 ]; then
    sysinfo
    break;
   elif [ $op = 6 ]; then
    lock
    break;
   elif [ $op = 0 ]; then
    echo -e $help
    break;
   elif [ $op = 9 ]; then
    exttweak
    break;
else
    echo -e "\nWrong input -_-"
fi

done
