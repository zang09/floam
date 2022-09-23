#!/bin/sh
docker run -it -d \
        --ipc host \
        --net host \
        --env="DISPLAY=$DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --privileged \
        --name floam-cv \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
        -v /home/${USER}:/home/${USER}:rw \
        -v /mnt:/mnt:rw \
        floam:1.0 /bin/bash
