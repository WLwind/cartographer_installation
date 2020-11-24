#!/bin/bash -e
set -o errexit
VERSION="v3.4.1"
sudo apt update
sudo apt install -y python3-wstool ninja-build
mkdir -p ~/cartographer_ws/src
cp .rosinstall ~/cartographer_ws/src/
cp Dockerfile.focal ~/
cp Dockerfile.noetic ~/
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
mv ~/Dockerfile.focal ~/cartographer_ws/src/cartographer/
mv ~/Dockerfile.noetic ~/cartographer_ws/src/cartographer_ros/
sed -i "s/python-sphinx/python3-sphinx/g" src/cartographer/package.xml
sed -i "s/python-sphinx/python3-sphinx/g" src/cartographer_ros/cartographer_ros/package.xml
sed -i "/melodic-cache.tar.gz/a\ \ - ROS_RELEASE=noetic DOCKER_CACHE_FILE=\/home\/travis\/docker\/noetic-cache.tar.gz" src/cartographer_ros/.travis.yml
mv src/cartographer/cartographer/mapping/3d/hybrid_grid_test.cc src/cartographer/cartographer/mapping/3d/hybrid_grid_test.cpp
sed -i "/project(cartographer_ros)/aadd_compile_options(-std=c++17)" src/cartographer_ros/cartographer_ros/CMakeLists.txt
sed -i "/project(cartographer_rviz)/aadd_compile_options(-std=c++17)" src/cartographer_ros/cartographer_rviz/CMakeLists.txt
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
catkin_make_isolated --install --use-ninja -j3
