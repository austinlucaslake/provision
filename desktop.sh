#!/bin/bash

# move to Downloads folder
cd ~/Downloads

# source updated repositories
sudo apt update

# startup USB disk creator
sudo apt-get install usb-creator-gtk

# gtkterm
sudo apt install gtkterm

# SSH Server
sudo apt install openssh-server
sudo ufw allow ssh

# gcc, g++, make
sudo apt install build-essential manpages-dev

# Anaconda
wget -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
bash ~/Downloads/anaconda.sh

# VirtualBox
wget -o virtualbox.deb https://download.virtualbox.org/virtualbox/6.1.32/virtualbox-6.1_6.1.32-149290~Ubuntu~eoan_amd64.deb
sudo apt install ./virtualbox.deb

# Visual Studio Code
wget -O vscode.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
sudo apt install ./vscode.deb

# JetBrains Toolbox
[ $(id -u) != "0" ] && exec sudo "$0" "$@"
echo -e " \e[94mInstalling Jetbrains Toolbox\e[39m"
echo ""

function getLatestUrl() {
USER_AGENT=('User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36')

URL=$(curl 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' -H 'Origin: https://www.jetbrains.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H "${USER_AGENT[@]}" -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.jetbrains.com/toolbox/download/' -H 'Connection: keep-alive' -H 'DNT: 1' --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')
echo $URL
}
getLatestUrl

FILE=$(basename ${URL})
DEST=$PWD/$FILE

echo ""
echo -e "\e[94mDownloading Toolbox files \e[39m"
echo ""
wget -cO  ${DEST} ${URL} --read-timeout=5 --tries=0
echo ""
echo -e "\e[32mDownload complete!\e[39m"
echo ""
DIR="/opt/jetbrains-toolbox"
echo ""
echo  -e "\e[94mInstalling to $DIR\e[39m"
echo ""
if mkdir ${DIR}; then
    tar -xzf ${DEST} -C ${DIR} --strip-components=1
fi

chmod -R +rwx ${DIR}
touch ${DIR}/jetbrains-toolbox.sh
echo "#!/bin/bash" >> $DIR/jetbrains-toolbox.sh
echo "$DIR/jetbrains-toolbox" >> $DIR/jetbrains-toolbox.sh

ln -s ${DIR}/jetbrains-toolbox.sh /usr/local/bin/jetbrains-toolbox
chmod -R +rwx /usr/local/bin/jetbrains-toolbox
echo ""
rm ${DEST}
echo  -e "\e[32mDone.\e[39m"

# VLC Media Player
sudo apt install vlc

# Sticky Notes
sudo apt install xpad

# Google Chrome
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./chrome.deb

# Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb

# Slack
wget -O slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.3.2-amd64.deb
sudo apt install ./slack.deb

# Zoom
wget -O zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom.deb

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client

# Remove unwanted packages
sudo apt update
sudo apt purge firefox
sudo apt purge thunderbird*
rm -rf ~/.mozilla
sudo apt purge libreoffice-common
sudo apt autoremove

# Update/upgrade packages, and reboot
sudo apt upgrade && sudo apt upgrade -y && sudo apt reboot
