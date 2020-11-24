# cartographer_installation
源码安装cartographer_ros的脚本，适用于ros noetic。安装版本为release-1.0.0，此为稳定版，melodic软件源的二进制版本为此版本，然而noetic没有二进制的cartographer包。  
* install.sh脚本需要在rosdep配置好的情况下进行，请先完成`sudo rosdep init`和`rosdep update`。  
* 如果没有成功初始化和更新过rosdep，请先使用config_rosdep.sh脚本，可以自动完成修改hosts文件和rosdep的初始化更新，在确保此脚本运行成功后再去运行install.sh脚本。  
* 请直接在cartographer_installation文件夹下运行脚本  
`./install.sh`或者先运行`./config_rosdep.sh`
