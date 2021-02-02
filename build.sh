#!/usr/bin/env sh

#cd assets/app
#sudo composer update
#cd ../..
docker build --no-cache --tag $1:latest .
