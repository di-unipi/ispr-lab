#! sh

# Default to docker, get flag -p to use podman
if [ "$1" = "-p" ]; then
    DOCKER=podman
else
    DOCKER=docker
fi

# build
$DOCKER build -t ispr-lab .
# run
$DOCKER run -p 8888:8888 \
    -v $(pwd)/notebooks:/app/notebooks:z \
    -v $(pwd)/_static:/app/_static:z \
    ispr-lab
