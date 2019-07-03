#!/bin/sh

# install google chrome
curl https://dl.google.com/chrome/mac/stable/CHFA/googlechrome.dmg --output googlechrome.dmg
sudo hdiutil attach googlechrome.dmg -quiet -nobrowse
cp -R /Volumes/Google\ Chrome/Google\ Chrome.app /Applications
sudo hdiutil detach /Volumes/Google\ Chrome/ -quiet
rm googlechrome.dmg

# install java8
curl "https://download.oracle.com/otn/java/jdk/8u211-b12/478a62b7d4e34b78b671c754eaaf38ab/jdk-8u211-macosx-x64.dmg?AuthParam=1562139807_31779ae637a5593c65da7c1a7e81b8f5" --output java.dmg
sudo hdiutil attach java.dmg -quiet -nobrowse
sudo installer -pkg /Volumes/JDK\ 8\ Update\ 211/JDK\ 8\ Update\ 211.pkg -target /
sudo hdiutil detach /Volumes/JDK\ 8\ Update\ 211 -quiet
rm java.dmg

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew cask install iterm2
brew install vim openssl zsh thefuck gzip git maven 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

# install 1password
curl -L https://app-updates.agilebits.com/download/OPM7 --output 1password.pkg
sudo installer -pkg 1password.pkg -target /
rm 1password.pkg

# install slack
read -p "Enter slack version to download (https://slack.com/intl/en-ch/downloads/mac?geocode=en-ch): " version
curl https://downloads.slack-edge.com/mac_releases/Slack-$version.dmg --output slack.dmg
sudo hdiutil attach slack.dmg -quiet -nobrowse
cp -R /Volumes/Slack.app/Slack.app /Applications
sudo hdiutil detach /Volumes/Slack.app -quiet

# install whatsapp
curl -L https://web.whatsapp.com/desktop/mac/files/WhatsApp.dmg --output WhatsApp.dmg
sudo hdiutil attach WhatsApp.dmg -quiet -nobrowse
cp -R /Volumes/WhatsApp\ Installer/WhatsApp.app /Applications
sudo hdiutil detach /Volumes/WhatsApp\ Installer -quiet

# install signal
read -p "Enter signal version to download (https://signal.org/download/): " version
curl https://updates.signal.org/desktop/signal-desktop-mac-$version.zip --output signal.zip
read -p "Unzip manually and press enter"
mv Signal.app /Applications

# install code
curl -L https://go.microsoft.com/fwlink/?LinkID=620882 --output code.zip
unzip -q code.zip
mv Visual\ Studio\ Code.app /Applications
rm code.zip

# install toolbox
read -p "Enter jetbrains toolbox version to download (https://www.jetbrains.com/toolbox/download/download-thanks.html): " version
curl -L https://download.jetbrains.com/toolbox/jetbrains-toolbox-$version.dmg --output toolbox.dmg
sudo hdiutil attach toolbox.dmg -quiet -nobrowse
cp -R /Volumes/JetBrains\ Toolbox/JetBrains\ Toolbox.app /Applications
sudo hdiutil detach /Volumes/JetBrains\ Toolbox -quiet

# setup zsh 
touch ~/.aliases
touch ~/.vimrc
echo "set mouse-=a" >> ~/.vimrc
echo "set backspace=2" >> ~/.vimrc

cp .zshrc ~/.zshrc

# setup git
read -p "Enter your email github key: " email
ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/github_id_rsa -q -N ""
echo "GitHub public key:"
cat ~/.ssh/github_id_rsa.pub
reap -p "Add this to your github account and press any key to continue"

read -p "Enter your email work key: " email
ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/work_id_rsa -q -N ""
echo "Work public key:"
cat ~/.ssh/work_id_rsa.pub

read -p "Enter your name: " name
git config --global user.name "$name"
git config --global user.email "$email"

