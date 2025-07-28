# acesteo-docker
This repository provides a Dockerfile and docker-compose.yml configuration to quickly set up and run ACEStep in a containerized environment. 
It comes pre-configured for GPU support with NVIDIA hardware, although it can be adapted for AMD or Intel GPUs.

## Overview

TODO

## Features

- Dockerized Environment: Easily deploy ACEStep with all necessary dependencies.
- GPU Support: Default setup for NVIDIA GPUs, with options for AMD/Intel GPUs.
- Persistent Volumes: Mounts for model and outputs to ensure persistent data.


## Prerequisites

Before you begin, ensure you have these dependencies installed:
- Docker
- Docker Compose 
- Nvidia container toolkit or equivalent for your system. Note: may come bundled with docker-desktop

If lacking any of these, please refer to each documentation on how to install on your system


## Getting started

1. Clone the repository
```shell
git clone 
cd 
```

2. Build the Docker Image
```shell
docker compose build
```

3. Start the container

Attached mode (will display logs in the terminal):
```shell
docker compose up
```
Press `Ctrl + C` to stop the container.


Detached mode:
```shell
docker compose up -d
```
To stop the container:
```shell
docker compose down
```

4. Access comfyui and start using it: http://localhost:7865


## GPU Support
There is no official documentation on AMD or intel GPU support for ACEStep.

If you have one of these, You will either have to test yourself, or use the ACEStep model through [ComfyUI](https://docs.comfy.org/tutorials/audio/ace-step/ace-step-v1) which seems to work.


## Additional resources
TODO