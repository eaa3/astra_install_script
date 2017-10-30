mkdir -p astra_example_ws/src
cd astra_example_ws/src
git clone https://github.com/clearpathrobotics/ros_astra_launch.git --branch upstream
git clone https://github.com/clearpathrobotics/ros_astra_camera.git --branch upstream
cd ..
rosdep install --from-paths src --ignore-src --rosdistro=indigo -y
catkin_make
source devel/setup.bash
rosrun astra_camera create_udev_rules

echo "###########################################"
echo "Please reboot. Do you want to reboot now (y/n)?"
echo "###########################################"
answer="n"
read answer
if echo "$answer" | grep -iq "^y" ;then
    echo "rebooting"
    #sudo reboot
else
    echo "Remember to reboot later."
fi
