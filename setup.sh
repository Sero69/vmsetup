#!/bin/bash

function update_system {
	echo "############################################################"
	echo "############################################################"
	echo "############################################################"
	echo "#################UPDATING SYSTEM############################"
	echo "############################################################"
	echo "############################################################"
	echo "############################################################"

	apt update && \
	apt upgrade -y && \
	apt autoremove -y && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get autoremove -y && \
	apt dist-upgrade -y
}

function pentest_tools {

	echo "############################################################"
	echo "############################################################"
	echo "#################INSTALLING PENTESTER TOOLS################"
	echo "############################################################"
	echo "############################################################"
	echo "############################################################"

	pentest="/opt/pentest_tools"

	if [ -d "$pentest" ]; then
		echo "****pentest_tools folder found****"	
	fi
	
	if [ ! -d "$pentest" ]; then
		echo "No pentest_tools folder found....creating"
		mkdir $pentest
	fi

	if [ ! -d "$pentest/privilege-escalation-awesome-scripts-suite" ]; then
		echo "No Linpeas/Winpeas folder.....creating"
		mkdir "$pentest/privilege-escalation-awesome-scripts-suite"
		echo "inpeas/Winpeas folder created...cloning"
		git clone "https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite" "$pentest/privilege-escalation-awesome-scripts-suite"
	else
		echo "Winpeas/LinPeas folder found....skipping"
	fi
	
	if [ ! -d "$pentest/wordlists" ]; then
		echo "No word lists folder found....creating"
		mkdir "$pentest/wordlists"
	else
		echo "Wordlists folder found....skipping"
	fi
	
	if [ ! -d "$pentest/wordlists/Seclists" ]; then
		echo "Cloning Seclists"
		mkdir "$pentest/wordlists/Seclists"
		git clone "https://github.com/danielmiessler/SecLists" "$pentest/wordlists/Seclists"
	else 
		echo "Seclists found....skipping"
	fi
			
}

function essential_tools {

	echo "############################################################"
	echo "############################################################"
	echo "############################################################"
	echo "#################INSTALLING ESSENTIAL TOOLS#################"
	echo "############################################################"
	echo "############################################################"
	echo "############################################################"
	apt install thonny -y
	apt install netcat -y
	apt install nmap -y
	apt install burpsuite -y
	apt install nikto -y
	apt install john -y
	apt install hashcat -y
	apt install gedit -y
	apt install wireshark -y
	apt install metasploit-framework
	
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm get-pip.py
	
	apt install python3
	pip3 install setuptools
	pip2 install setuptools
	
	pip2 install requests
	pip3 install requests
	pip2 install colorama
	pip3 install colorama
	
	git clone "https://github.com/SecureAuthCorp/impacket"
	pip3 install ./impacket/.
	rm -R impacket

}

function setup_root {

	echo "************SET ROOT PASSWORD************"
	passwd root

}

update_system
essential_tools
pentest_tools
setup_root

clear

echo "############################################################"
echo "############################################################"
echo "############################################################"
echo "#################SETUP COMPLETE#############################"
echo "############################################################"
echo "############################################################"
echo "############################################################"
