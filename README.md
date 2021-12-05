# cartographer_installation
源码安装cartographer_ros的脚本，适用于ros noetic。安装cartographer的版本为release-2.0.0，cartographer_ros的版本为master分支的c06879b63567a78ef92b7d1fa79453839e36ffec。  
* install.sh脚本需要在rosdep配置好的情况下运行，请先完成`sudo rosdep init`和`rosdep update`。如果无法成功初始化和更新rosdep，可使用[离线脚本](https://github.com/WLwind/update_rosdep.git)，可替代这两个命令。  
* 准备好后请在cartographer_installation文件夹下运行脚本`./install.sh`。
