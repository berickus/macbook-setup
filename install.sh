#!/bin/sh

cd ~/Downloads/

# install google chrome
if [ ! -d "/Applications/Google Chrome.app" ]; then
	echo "Installing Google Chrome"
	curl https://dl.google.com/chrome/mac/stable/CHFA/googlechrome.dmg --output googlechrome.dmg
	sudo hdiutil attach googlechrome.dmg -quiet -nobrowse
	cp -R /Volumes/Google\ Chrome/Google\ Chrome.app /Applications
	sudo hdiutil detach /Volumes/Google\ Chrome/ -quiet
	rm googlechrome.dmg
else
	echo "Google Chrome already installed, skipping..."
fi

# install java8
echo "Install java 8 from https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"
read -p "press any key to continue"

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew cask install iterm2
brew install vim openssl zsh thefuck gzip git maven git-flow
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

# install 1password
if [ ! -d "/Applications/1Password 7.app" ]; then
	echo "Installing 1Password"
	curl -L https://app-updates.agilebits.com/download/OPM7 --output 1password.pkg
	sudo installer -pkg 1password.pkg -target /
	rm 1password.pkg
else
	echo "1Password already installed, skipping..."
fi

# install slack
if [ ! -d "/Applications/Slack.app" ]; then
	echo "Installing Slack"
	read -p "Enter slack version to download (https://slack.com/intl/en-ch/downloads/mac?geocode=en-ch): " version
	curl https://downloads.slack-edge.com/mac_releases/Slack-$version-macOS.dmg --output slack.dmg
	sudo hdiutil attach slack.dmg -quiet -nobrowse
	cp -R /Volumes/Slack.app/Slack.app /Applications
	sudo hdiutil detach /Volumes/Slack.app -quiet
else
	echo "Slack already installed, skipping..."
fi

# install whatsapp
if [ ! -d "/Applications/WhatsApp.app" ]; then
	echo "Installing WhatsApp"
	curl -L https://web.whatsapp.com/desktop/mac/files/WhatsApp.dmg --output WhatsApp.dmg
	sudo hdiutil attach WhatsApp.dmg -quiet -nobrowse
	cp -R /Volumes/WhatsApp\ Installer/WhatsApp.app /Applications
	sudo hdiutil detach /Volumes/WhatsApp\ Installer -quiet
	rm WhatsApp.dmg
else
	echo "WhatsApp already installed, skipping..."
fi

# install signal
if [ ! -d "/Applications/Signal.app" ]; then
	echo "Installing Signal"
	read -p "Enter signal version to download (https://signal.org/download/): " version
	curl https://updates.signal.org/desktop/signal-desktop-mac-$version.zip --output signal.zip
	read -p "Unzip manually and press enter"
	mv Signal.app /Applications
else
	echo "Signal already installed, skipping..."
fi

# install code
if [ ! -d "/Applications/Visual Studio Code.app" ]; then
	echo "Installing Microsoft Code"
	curl -L https://go.microsoft.com/fwlink/?LinkID=620882 --output code.zip
	unzip -q code.zip
	mv Visual\ Studio\ Code.app /Applications
	rm code.zip
else
	echo "Microsoft Code already installed, skipping..."
fi

# install toolbox
if [ ! -d "/Applications/JetBrains Toolbox.app" ]; then
	echo "Installing JetBrains Toolbox"
	echo "Download toolbox from here: https://www.jetbrains.com/toolbox/download/download-thanks.html"
	read -p "press any key to continue"
	sudo hdiutil attach jetbrains-toolbox*.dmg -quiet -nobrowse
	cp -R /Volumes/JetBrains\ Toolbox/JetBrains\ Toolbox.app /Applications
	sudo hdiutil detach /Volumes/JetBrains\ Toolbox -quiet
	rm jetbrains-toolbox*.dmg
else
	echo "JetBrains Toolbox already installed, skipping..."
fi

# install google drive
if [ ! -d "/Applications/Backup and Sync.app" ]; then
        echo "Installing Google Backup and Sync"
	curl -L https://dl.google.com/drive/InstallBackupAndSync.dmg --output InstallBackupAndSync.dmg
        sudo hdiutil attach InstallBackupAndSync.dmg -quiet -nobrowse
        cp -R /Volumes/Install\ Backup\ and\ Sync\ from\ Google/Backup\ and\ Sync.app /Applications
        sudo hdiutil detach /Volumes/Install\ Backup\ and\ Sync\ from\ Google -quiet
        rm InstallBackupAndSync.dmg
else
        echo "Google Backup and Sync already installed, skipping..."
fi

# install libreoffice
if [ ! -d "/Applications/LibreOffice.app" ]; then
        echo "Installing LibreOffice"
        curl -L https://mirror.init7.net/tdf/libreoffice/stable/6.2.5/mac/x86_64/LibreOffice_6.2.5_MacOS_x86-64.dmg --output LibreOffice.dmg
        sudo hdiutil attach LibreOffice.dmg -quiet -nobrowse
        cp -R /Volumes/LibreOffice/LibreOffice.app /Applications
        sudo hdiutil detach /Volumes/LibreOffice -quiet
        rm LibreOffice.dmg
else
        echo "LibreOffice already installed, skipping..."
fi

# setup zsh 
touch ~/.aliases
touch ~/.vimrc
echo "set mouse-=a" >> ~/.vimrc
echo "set backspace=2" >> ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc

curl "https://raw.githubusercontent.com/berickus/macbook-setup/master/.zshrc" -O
cp .zshrc ~/.zshrc

# setup git
read -p "Enter your email github key: " email
ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/github_id_rsa -q -N ""
echo "GitHub public key:"
cat ~/.ssh/github_id_rsa.pub
read -p "Add this to your github account and press any key to continue"

read -p "Enter your email work key: " email
ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/work_id_rsa -q -N ""
echo "Work public key:"
cat ~/.ssh/work_id_rsa.pub

read -p "Enter your name: " name
git config --global user.name "$name"
git config --global user.email "$email"
git config --global core.autocrlf input

touch ~/.ssh/config
chmod 644 ~/.ssh/config

echo "Host *
	ServerAliveInterval 120
	ServerAliveCountMax 30
	AddKeysToAgent yes
	UseKeychain yes

# Github
Host github.com
	IdentityFile ~/.ssh/github_id_rsa
	User Berickus
" >> ~/.ssh/config

# checkout macsetup
mkdir -p ~/Documents/checkouts
git clone git@github.com:berickus/macbook-setup.git git.macbook-setup
