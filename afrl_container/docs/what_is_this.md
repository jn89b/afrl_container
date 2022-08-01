# What is this github repo?

This repo has docker containers that are used to build Ubuntu -> Ros -> MAVROS 

This is done by overlaying these repos together

To build docker container do the following:

```
cd afrl_container

make term
```

make term builds the **term** task from the Makefile, this then builds an overlay workspace (basically a catkin_ws) where you can develop/update your base code without fear of OS version control or missing dependencies. 

## Important notes
the Makefile scripts will have lines such as 

```
.PHONY: term
term:
	@docker run -i --net=host \
		--device=/dev/ttyUSB0 \
		${DOCKER_ARGS} ${IMAGE_NAME}_overlay \
		bash

```
--device=/dev/ttyUSB0 is notated as a serial port that the docker container will look for. For this application this USB links to the PX4's telemetry 2 connection interface with an FTDI cable, change this port accordingly. 

You can find the port of the PX4 by entering the following command in the terminal:

```
ls /dev
```

Look for the anything that is USB or ACM0