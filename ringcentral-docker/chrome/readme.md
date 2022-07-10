# github
https://github.com/stephen-fox/chrome-docker/blob/master/image/Dockerfile

# Medium article
https://medium.com/dot-debug/running-chrome-in-a-docker-container-a55e7f4da4a8

# Building the docker image
docker build -t local/chrome:0.0.1 .

# running the docker image
docker run -p 5900:5900 -e VNC_SERVER_PASSWORD=password --user apps --privileged local/chrome:0.0.1
