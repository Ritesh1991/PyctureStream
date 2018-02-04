#!/bin/bash

HOME = "/home/cloudera"

# Install Anaconda with Jupyter
if [ ! -d "$HOME/anaconda2" ]; then
    wget https://repo.continuum.io/archive/Anaconda2-5.0.1-Linux-x86_64.sh && chmod +x Anaconda2-5.0.1-Linux-x86_64.sh && ./Anaconda2-5.0.1-Linux-x86_64.sh
else
    echo "Anaconda3 was already installed."
fi

# Download Start Script for Jupyter with pySpark
rm -f "$HOME/start_jupyter.sh"
wget https://raw.githubusercontent.com/dynobo/PyctureStream/master/start_jupyter.sh && chmod +x ./start_jupyter.sh
if [ ! -d "$HOME/notebooks" ]; then
    mkdir "$HOME/notebooks"
fi

# Enable Cron
CMD='/sbin/runuser cloudera -s /bin/bash -c "/home/cloudera/start_jupyter.sh &"'
grep -q -F "$CMD" /etc/rc.d/rc.local || echo "$CMD" | sudo tee -a /etc/rc.d/rc.local
