#!/bin/bash -e
set -o errexit
VERSION="v3.4.1"
sudo apt-get update
sudo apt-get install -y python-wstool python-rosdep ninja-build
mkdir -p ~/cartographer_ws/src
cp .rosinstall ~/cartographer_ws/src/
cd ~/cartographer_ws
wstool update -t src
git clone https://gitee.com/WLwindlinfeng/protobuf.git
cd protobuf
git checkout tags/${VERSION}
mkdir build
cd build
cmake -G Ninja \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -Dprotobuf_BUILD_TESTS=OFF \
  ../cmake
ninja
sudo ninja install
cd ~/cartographer_ws
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
catkin_make_isolated --install --use-ninja
