# cartographer_installation
源码安装cartographer_ros的脚本，原则上适用于ros kinetic和ros melodic。安装版本为release-1.0.0，此为稳定版，melodic软件源的二进制版本为此版本，所以建议没有改动源码需求的melodic用户直接用`sudo apt install ros-melodic-cartograper-ros`方式安装，更加便捷。  
此脚本需要在rosdep配置好的情况下进行，请先完成`sudo rosdep init`和`rosdep update`。
请直接在cartographer_installation文件夹下运行脚本
`./install.sh`
