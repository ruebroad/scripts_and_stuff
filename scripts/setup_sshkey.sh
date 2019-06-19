NAME=$1

ssh-keygen -t rsa -b 4096 -C "rupert.broad@ohpen.com" -f ~/.ssh/$NAME

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/$NAME
