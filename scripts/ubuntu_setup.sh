sudo apt update
# install git
sudo apt install git -y

# Install curl
sudo apt install curl -y

# Install gnome tweaks
sudo apt install gnome-tweaks

# install brave browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

source /etc/os-release

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list

sudo apt update

sudo apt install brave-keyring brave-browser


# install vscode
sudo snap install code --classic

# install gitkraken
sudo snap install gitkraken

# install zsh
sudo apt install zsh -y

# make zsh default - requires logout to work
chsh -s $(which zsh)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install zsh-completions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

## add zsh-conmpletions to plugins in .zshrc
autoload -U compinit && compinit


# install powerline
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo "source ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme \n" >> ~/.zshrc

# install awesome fonts
mkdir -p ~/code/new_fonts/
git clone https://github.com/gabrielelana/awesome-terminal-fonts.git ~/code/useful-repos/
mkdir -p ~/.fonts
cp ~/code/useful-repos/awesome-terminal-fonts/build/* ~/.fonts
fc-cache -fv ~/.fonts
mkdir ~/.config/fontconfig/conf.d/
cp ~/code/useful-repos/awesome-terminal-fonts/config/10-symbols.conf ~/.config/fontconfig/conf.d/10-symbols.conf
echo "\n"
echo "source ~/.fonts/*.sh \n" >> ~/.zshrc

# Syntax highlighting
cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \n" >> ~/.zshrc

# Auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh \n" >>  ~/.zshrc
# plugins=(zsh-autosuggestions)

# Colour ls output
echo "alias ls='ls -G'" >> ~/.zshrc

# Add alias for terraform and chef test kitchen
echo "alias tfm='terraform'"  >> ~/.zshrc
echo "alias ctk='kitchen'"  >> ~/.zshrc

# zsh customizations
echo "plugins=(git aws brew docker github kubectl)" >> ~/.zshrc
echo "POWERLEVEL9K_MODE='nerdfont-complete'"  >> ~/.zshrc
echo "ZSH_THEME=\"powerlevel9k/powerlevel9k\""  >> ~/.zshrc
echo "POWERLEVEL9K_SHORTEN_STRATEGY=\"truncate_middle\""  >> ~/.zshrc
echo "POWERLEVEL9K_STATUS_VERBOSE=false"  >> ~/.zshrc
echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)" >> ~/.zshrc
echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws)" >> ~/.zshrc
echo "POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=\"black\"" >> ~/.zshrc
echo "POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=\"135\"" >> ~/.zshrc
echo "POWERLEVEL9K_AWS_FOREGROUND=\"black\"" >> ~/.zshrc
echo "POWERLEVEL9K_AWS_BACKGROUND=\"166\" # darkorange3a" >> ~/.zshrc

# install python, pip, awscli
sudo apt install python3 python3-pip -y
pip3 install awscli --upgrade

# install polarr
sudo snap install polarr


