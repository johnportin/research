# Run "sh readme.sh" to start this container.

docker container run -it --name tograph --mount type=bind,source=$(pwd),target=/host tograph:latest