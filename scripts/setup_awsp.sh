
wget -O ~/awsp_functions.sh https://raw.githubusercontent.com/antonbabenko/awsp/master/awsp_functions.sh
chmod +x ~/awsp_functions.sh


echo "alias awsall=\"_awsListAll\"" >> ~/.zshrc
echo "alias awsp=\"_awsSwitchProfile\"" >> ~/.zshrc
echo "alias asp=\"_awsSwitchProfile\"" >> ~/.zshrc
echo "alias awswho=\"aws configure list\"" >> ~/.zshrc

echo "complete -W \"$(cat $HOME/.aws/credentials | grep -Eo '\[.*\]' | tr -d '[]')\" _awsSwitchProfile" >> ~/.zshrc