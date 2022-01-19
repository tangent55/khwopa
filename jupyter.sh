#!/bin/ash
##
## This is a bash script to install jupyter in freshly created containers.
## Please contact Deep mind Creations Pvt. Ltd. if you have any issues or 
## want to make changes in script.
##
## The following line adds required dependencies.
apk add --no-cache build-base python3-dev zeromq-dev freetype-dev gcc \
	libpng-dev libffi-dev
PID1=$!
wait $PID1
echo "Exit Status: $?"
##
## The following line ensures that pip is installed.
python3 -m ensurepip
PID2=$!
wait $PID2
echo "Exit Status: $?"
##
## The following line installs jupyter through pip.
pip3 install --no-cache-dir jupyter
PID3=$!
wait $PID3
echo "Exit Status: $?"

notebooks=/root/notebooks
if [ -e "$notebooks" ];
then echo "$notebooks exists."
else mkdir /root/notebooks
fi

jupyter=/root/.jupyter
if [ -e "$jupyter" ]
then echo "$jupyter exists."
else mkdir /root/.jupyter
fi

##
## The following lines is for Jupyter configurations. Change it if necessary.

jconfig=/root/.jupyter/jupyter_notebook_config.py
if [ -f "$jconfig" ]
then echo "$jconfig exists."
else echo "c.NotebookApp.allow_root = True
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.notebook_dir = '/root/notebooks'" >> /root/.jupyter/jupyter_notebook_config.py
fi

PID4=$!
wait $PID4
echo "Exit Status: $?"
