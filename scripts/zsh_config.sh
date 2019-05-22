touch ~/.hushlogin

# Set zsh as default shell
chsh -s $(which zsh)

# Install completions
brew install zsh zsh-completions

# Nerd fonts
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

# Powerline
brew tap sambadevi/powerlevel9k
brew install powerlevel9k

# Download and install awesome terminal fonts https://github.com/gabrielelana/awesome-terminal-fonts/wiki/OS-X
mkdir -p ~/code/new_fonts
cd ~/code/new_fonts
git clone git@github.com:gabrielelana/awesome-terminal-fonts.git
# install fonts manually - see link

mkdir -p ~/.fonts
cp ~/code/new_fonts/awesome-terminal-fonts/build/* ~/.fonts

# Syntax highlighting

cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \n" >> ~/.zshrc
echo "source ~/.fonts/*.sh \n" >> ~/.zshrc
echo "source ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme \n" >> ~/.zshrc

# Customizing the prompt
https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt

# Colour ls output
echo "alias ls='ls -G'" >> ~/.zshrc

# Add alias for terraform and chef test kitchen
echo "alias tfm='terraform'"  >> ~/.zshrc
echo "alias ctk='kitchen'"  >> ~/.zshrc

# Other links
https://medium.com/the-code-review/powerlevel9k-personalise-your-prompt-for-any-programming-language-68974c127c63
https://medium.com/the-code-review/nerd-fonts-how-to-install-configure-and-remove-programming-fonts-on-a-mac-178833b9daf3
https://medium.com/the-code-review/make-your-terminal-more-colourful-and-productive-with-iterm2-and-zsh-11b91607b98c
https://medium.freecodecamp.org/how-you-can-style-your-terminal-like-medium-freecodecamp-or-any-way-you-want-f499234d48bc



echo "plugins=(git aws brew docker github osx zsh-syntax-highlighting kubectl)" >> ~/.zshrc
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