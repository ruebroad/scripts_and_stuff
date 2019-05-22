# cd into the directory containing the code, a project directory, or a directory for hosting python virtual envs
# .venv can be replaced by any directory name

if $1 == ""; then
  pip3 install virtualenv
  virtualenv .venv --python=python3
  source .venv/bin/activate
else
  pip3 install virtualenv
  virtualenv $1 --python=python3
  source $1/bin/activate
fi