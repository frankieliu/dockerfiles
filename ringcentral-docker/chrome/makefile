doc:
	# Medium article
	https://medium.com/dot-debug/running-chrome-in-a-docker-container-a55e7f4da4a8

build:
	# Building the docker image
	docker build -t local/chrome:0.0.1 .

run:
	# running the docker image
	docker run -p 5901:5901 -e VNC_SERVER_PASSWORD=password --user apps -it local/chrome:0.0.1 bash
