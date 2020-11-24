#!/bin/bash -e
set -o errexit
sudo apt update
sudo apt install -y python3-rosdep
sudo sh -c "echo '199.232.28.133 raw.githubusercontent.com' >> /etc/hosts"
rosdep init
rosdep update
