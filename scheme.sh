#!/bin/sh
docker container run --rm -i -v "$(pwd)":/usr/src -w /usr/src/ mit-scheme "$@"
