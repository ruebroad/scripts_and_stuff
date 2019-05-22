#!/bin/bash

cd $1

touch repos.txt

dirs=$(ls -d ./excp*)

for dir in $dirs
  do 
    echo $dir
    echo "#####################" >> "$1/repos.txt"
    echo "$dir" >> "$1/repos.txt"
    cd $dir 
    git ls-files | xargs wc -l >> "$1/repos.txt"
    cd ..
done







# git ls-files > listOfFiles
# cat listOfFiles | xargs wc -l