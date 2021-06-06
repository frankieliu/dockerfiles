build:
	docker build --no-cache .

list-images:
	docker images

tag:
	docker image tag #### ####

docker: # f5 is part of the tag
	docker run -p 5901:5901 -v $(pwd):/data --rm -it f5 bash

ready:
	bash -c "echo -e '123456\n123456\nn' | vncpasswd"
	ln -s /data/Xresources /root
	ln -s /data/tiger.sh /root
	ln -s /data/Xvnc-session /root/.vnc

install-docker:
	sudo aptitude remove docker 
	sudo aptitude update
	sudo aptitude install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo aptitude update
	sudo aptitude install docker-ce docker-ce-cli containerd.io
	sudo usermod -aG docker adas makefile 
	
tags:	
	docker image tag a67 frankieliu/chrome-vnc-openbox:v1
	docker image rm frankieliu/chrome-vnc-openbox:latest
	docker image tag 2599 frankieliu/chrome-vnc-openbox:latest
	docker login # frankieliu
	docker push frankieliu/chrome-vnc-openbox:latest
	cd r
	docker build --no-cache .
	docker tag e549 frankieliu/chrome-vnc-openbox-r:v0
	docker image rm frankieliu/chrome-vnc-openbox-r:latest
	docker image tag 2022694cfe27 frankieliu/chrome-vnc-openbox-r:latest
	docker push frankieliu/chrome-vnc-openbox-r:latest

vnc:
	docker run -p 5998:5998 -v $(pwd):/data --rm -it frankieliu/chrome-vnc-openbox-r:latest bash
	vncserver -localhost no :98
