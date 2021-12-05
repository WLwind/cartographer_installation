#!/bin/bash -e
set -o errexit
sudo apt update
sudo apt install -y python3-wstool ninja-build stow libgmock-dev
mkdir -p ~/cartographer_ws/src
cp .rosinstall ~/cartographer_ws/src/
cd ~/cartographer_ws
wstool update -t src
git clone https://gitee.com/WLwindlinfeng/abseil-cpp.git
cd abseil-cpp
git checkout d902eb869bcfacc1bad14933ed9af4bed006d481
mkdir build
cd build
cmake -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DCMAKE_INSTALL_PREFIX=/usr/local/stow/absl \
  ..
ninja
sudo ninja install
cd /usr/local/stow
sudo stow absl
cd ~/cartographer_ws
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
catkin_make_isolated --install --use-ninja -j3
