#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
	#Update and Upgrade
	echo "Updating and Upgrading"
	apt-get update && sudo apt-get upgrade -y

	sudo apt-get install dialog
	cmd=(dialog --separate-output --checklist "Created By Anzaku Pius A. 2021.\nPlease Select Software you want to install:" 22 76 16)
	options=(1 "Nodejs" off    # any option can be set to default to "on"
	         2 "Git" off
	         3 "Velocity" off
	         4 "Visual Studio Code" off
	         5 "VLC" off
	         6 "Python" off
	         7 "Postman" off
	         8 "Bitnami XSAMPP" off
	         9 "DBeaver" off
	        10 "Boostnote" off
	        11 "Chrome" off
	        12 "YouTube Downloader" off
	        13 "Filezilla" off
	        14 "Zoom" off
	        15 "Gravit Designer" off
	        16 "Webp" off
	        17 "Create-React-App" off
	        18 "Vue CLI" off
	        19 "Fkill CLI" off
	        20 "TypeScript" off )
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
				
			1)
				#Install Nodejs
				echo "Installing Nodejs"
				curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
				sudo apt-get -y install nodejs
				;;
			2)
				#Install git
				echo "Installing Git, please congiure git later..."
				apt install git -y
				;;
			3)
				#Velocity
				echo "Installing Velocity"
				sudo apt-get install velocity-doc -y
				;;
			4)
				#VScode
				echo "Installing VS Code"
				sudo apt install software-properties-common apt-transport-https wget
				wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
				sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
				sudo apt install code -y
				;;
			5)
				#VLC Media Player
				echo "Installing VLC Media Player"
				sudo snap install vlc 
				;;
			6)
				#Python 
				echo "Installing Python"
				sudo apt install software-properties-common
				sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
				sudo apt install python3 -y
				;;
  			7)
				#Postman 
				echo "Installing Postman"
				sudo snap install postman
				;;
			8)
				#Bitnami XAMPP
				echo "Installing Bitnami XAMPP" 
				sudo mkdir Bitnami 
				cd Bitnami
				wget https://www.apachefriends.org/xampp-files/8.1.0/xampp-linux-x64-8.1.0-0-installer.run
				sudo chmod 755 xampp-linux-x64-8.1.0-0-installer.run
				sudo ./xampp-linux-x64-8.1.0-0-installer.run
				;;
			9)
				#DBeaver 
				echo "Installing DBeaver"
				sudo apt update
				sudo snap install dbeaver-ce
				;;
			10)
				#Boostnote 
				echo "Installing Boostnote"
				sudo apt update
				sudo wget https://github.com/BoostIO/boost-releases/releases/download/v0.8.19/boostnote_0.8.19_amd64.deb
				ls -l boostnote_0.8.19_amd64.deb
				sudo dpkg -i boostnote_0.8.19_amd64.deb
				sudo apt-get install -f
				sudo dpkg -l boostnote
				;;
			11)
				#Chrome 
				echo "Installing Chrome"
				sudo apt update
				wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
				sudo apt install ./google-chrome-stable_current_amd64.deb
				;;
			12)
				#YouTube Downloader
				echo "Installing Youtube-dl"
				sudo apt-get install -y youtube-dl 
				;;
			13)
				#Filezilla
				echo "Installing Filezilla"
				sudo apt update
				sudo apt install -y filezilla 
				;;
			14)
				#Zoom
				echo "Installing Zoom"
				sudo apt update
				sudo snap install zoom-client
				;;
			15)
				#Gravit Designer
				echo "Installing Gravit Designer"
				sudo snap install gravit-designer
				;;
			16)
				#Webp
				echo "installing Webp"
				sudo apt-get install -y webp
				;;
			17)
				#Create-React-App
				echo "Installing create-react-app"
				npm install -g create-react-app
				;;
			18)
				#Vue CLI
				echo "Installing Vue CLI"
				npm install -g @vue/cli
				;;
			19)
				#Fkil CLI
				echo "Installing Fkill CLI"
				npm install -g fkill-cli 
				;;
			20)
				#TypeScript
				echo "Installing TypeScript"
				npm install -g typescript
				;;
	    esac
	done
fi
