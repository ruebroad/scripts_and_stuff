NAME=$1
EMAIL=$2

ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f ~/.ssh/$NAME

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/$NAME
