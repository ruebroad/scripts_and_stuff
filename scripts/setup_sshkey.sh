ssh-keygen -t rsa -b 4096 -C "rupert.broad@email;.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa
