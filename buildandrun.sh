#!/bin/sh

#This builds and runs the dockerfile, used for local development only.


docker build -t etherpad .
docker run -p 9001:9001 etherpad