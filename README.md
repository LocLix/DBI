# Dockerize-Base-Image

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Install](#install)
- [Usage](#usage)
- [Build your image](#build)

## About <a name = "about"></a>

This is a simple and minimal repository containing a easy to use directory tree to better organize Docker image development

## Getting Started <a name = "getting_started"></a>

### Prerequisites

You will need Docker or Docker-CE installed on your system, below you can find a short install guide for Docker-CE on Ubuntu based distros

Do you have Docker already up and running? Jump to [installation](#install)

Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them and add HTTPS support to APT:

```sh
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

```

Add Docker’s official GPG key:

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Then, install Docker Engine for x86_64 / amd64 (for arm64 and armhf see [official Docker guide](https://docs.docker.com/engine/install/):

```sh
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

### Install <a name = "install"></a>

You just need to clone this repository or [use it as template](https://github.com/LocLix/Dockerize-Base-Image/generate): to clone the repository, just type

```sh
git clone https://github.com/LocLix/Dockerize-Base-Image && cd Dockerize-Base-Image
```

## Project structure <a name = "structure"></a>

```
┣ .devcontainer/ .................. This contains VSCode Development Container configuration files
┃ ┣ Dockerfile .................... Source Dockerfile for VSCode Development Container
┃ ┗ devcontainer.json ............. Configuration file for VSCode Development Container
┣ assets/ ......................... All image related environment files must be here
┃ ┣ app/ .......................... All app-specific binaries/script/htdocs/etc... files must be here
┃ ┃ ┗ place_here_your_app_files ... 
┃ ┗ scripts/ ...................... All configuration scripts including entrypoint must be here
┃   ┣ install-composer.sh ......... 
┃   ┗ start.sh .................... Image entrypoint
┣ .gitattributes
┣ .gitignore
┣ Dockerfile ...................... Image Dockerfile
┣ README.md
┗ build ........................... A stupid script to build your image locally, type ./build to view usage
```

### Reference
[VSCode Development Container](https://code.visualstudio.com/docs/remote/containers)

## Usage <a name = "usage"></a>

Just prepare your image following the structure above (and, optionally, configure the VSCodeDC environment) and build it!

## Build the image <a name = "build"></a>

To build your image you have to move to the project root and run:

```sh
docker build --no-cache --tag <image-name>:<version_tag|latest> .
```

or use the integrated stupid script (it will automatically tag the image as `latest`):

```sh
./build <image-name>
```
