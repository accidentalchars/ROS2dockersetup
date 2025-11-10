FROM osrf/ros:jazzy-desktop

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install commonly used ROS2 packages
RUN apt-get update && apt-get install -y \
    # Development tools
    python3-pip \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-vcstool \
    bash-completion \
    git \
    wget \
    curl \
    vim \
    nano \
    # ROS2 packages - Navigation
    # ros-jazzy-navigation2 \
    # ros-jazzy-nav2-bringup \
    # ROS2 packages - SLAM
    # ros-jazzy-slam-toolbox \
    # ROS2 packages - Robot State Publisher
    # ros-jazzy-robot-state-publisher \
    # ros-jazzy-joint-state-publisher \
    # ros-jazzy-joint-state-publisher-gui \
    # ROS2 packages - TF
    # ros-jazzy-tf2-tools \
    # ROS2 packages - Visualization
    ros-jazzy-rqt \
    ros-jazzy-rqt-common-plugins \
    # ROS2 packages - Additional tools
    ros-jazzy-teleop-twist-keyboard \
    ros-jazzy-teleop-twist-joy \
    ros-jazzy-joy \
    # Clean up
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep update

# Set working directory
WORKDIR /root/ros2_ws

# Default command
CMD ["/bin/bash"]
