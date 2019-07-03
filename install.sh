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
curl https://downloads.slack-edge.com/mac_releases/Slack-3.4.2.dmg --output slack.dmg
sudo hdiutil attach slack.dmg -quiet -nobrowse
cp -R /Volumes/Slack.app/Slack.app /Applications
sudo hdiutil detach /Volumes/Slack.app -quiet

# install whatsapp
curl -L https://web.whatsapp.com/desktop/mac/files/WhatsApp.dmg --output WhatsApp.dmg
sudo hdiutil attach WhatsApp.dmg -quiet -nobrowse
cp -R /Volumes/WhatsApp\ Installer/WhatsApp.app /Applications
sudo hdiutil detach /Volumes/WhatsApp\ Installer -quiet

# install signal
curl https://updates.signal.org/desktop/signal-desktop-mac-1.25.3.zip --output signal.zip
read -p "Unzip manually and press enter"
mv Signal.app /Applications

# install code
curl -L https://go.microsoft.com/fwlink/?LinkID=620882 --output code.zip
unzip -q code.zip
mv Visual\ Studio\ Code.app /Applications
rm code.zip

# install toolbox
curl -L https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.15.5387.dmg --output toolbox.dmg
sudo hdiutil attach toolbox.dmg -quiet -nobrowse
cp -R /Volumes/JetBrains\ Toolbox/JetBrains\ Toolbox.app /Applications
sudo hdiutil detach /Volumes/JetBrains\ Toolbox -quiet

# setup zsh 
touch .aliases

rm -f ~/.zshrc
sudo ln -s ~/.zshrc ~/.zshrc

rm -f ~/checkout
sudo ln -s ~/Documents/checkout ~/checkout

# setup git
git config --global user.name "Benjamin Vonlanthen"
git config --global user.email "benjamin.vonlanthen@tamedia.ch"

