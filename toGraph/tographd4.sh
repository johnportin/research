# Run "sh readme.sh" to start this container.


# docker container run -it --name tograph tograph:latest
docker container run --rm -it --name tograph --mount type=bind,source=$(pwd),target=/host tographd4:latest