# Run "sh readme.sh" to start this container.

docker container run -it --name macaulay2 --mount type=bind,source=$(pwd),target=/host jportin13/macaulay2:test