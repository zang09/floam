FROM osrf/ros:melodic-desktop-full

MAINTAINER haebeom <zang09@naver.com>

EXPOSE 22

# Install essential package
RUN apt-get update && apt-get install -y \
    sudo \
    openssh-server \
    build-essential \
    pkg-config \
    cmake \
    git \
    wget \
    curl \
    tar \
    unzip \
    gedit \
    nautilus
    
RUN apt-get update && apt-get install -y \
    ros-melodic-hector-trajectory-server \
    libgoogle-glog-dev libgflags-dev \
    libatlas-base-dev \
    libeigen3-dev \
    libsuitesparse-dev
    
SHELL ["/bin/bash", "-c"]

# Install ceres-solver
RUN mkdir -p /home/container/ThirdParty
WORKDIR /home/container/ThirdParty
RUN wget https://github.com/ceres-solver/ceres-solver/archive/refs/tags/1.14.0.tar.gz \
    && tar zxf 1.14.0.tar.gz \
    && cd ceres-solver-1.14.0 \
    && mkdir build && cd build \
    && cmake ../../ceres-solver-1.14.0 \
    && make -j3 \
    && make test \
    && make install

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/container/catkin_ws/src
WORKDIR /home/container/catkin_ws
RUN cd src \
    && git clone https://github.com/zang09/floam.git \
    && cd .. \
    && source /opt/ros/melodic/setup.bash \
    && catkin_make
       
# Load ROS environment at each run
COPY ./ros_entrypoint.sh /
RUN chmod 755 /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]
