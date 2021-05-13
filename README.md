# Overview
My solutions to the exercises and problems from SICP.

# Running the examples
I'm running Scheme in Docker. The Dockerfile is based on [inikolaev/docker-images](https://github.com/inikolaev/docker-images/tree/master/alpine-scheme).

## Installation
1. Install Docker
1. Run `./build.sh`

## Running
* For interactive mode, just run `./scheme.sh`.
* To pass a file - `./scheme.sh --quiet < ./src/hello_world.scm`