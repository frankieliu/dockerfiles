# python dataprocessing
https://pythonspeed.com/articles/containers-filesystem-data-processing/

# build

## Adding a script
COPY script.py /Dockerpath
RUN chmod 666 /Dockerpath/script.py

## if you want the entry point to be the script
ENTRYPOINT ["python", "/Dockerpath/script.py"]

# run

 # here the inputs would relate to the inputs of the entry point
 docker run -v localDir:dockerDir -w dockerDir image input1 input2

## user id
 # make sure the saved file will have the correct user and group
 docker run -u "$(id -u):$(id -g)" -v localDir:dockerDir -w dockerDir image input1 input2

## singularity
### pull the image

singularity pull docker://
./someImage.sif input1 input2

$HOME $PWD /tmp are automatically mounted
container runs as current user

# list containers
docker container ls
docker container ls -a
docker ps      # deprecated 
docker ps -a

# kill containers
docker container kill
docker kill

# list ports
docker container port

# remove container
docker container rm
docker rm

# remove image
docker rmi

# stop container
docker container stop

# top a container
docker container top
docker top

# stats
docker container stats
docker stats

# rename
docker rename



