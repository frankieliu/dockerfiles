build:
	docker build .
images:
	docker images
tag:
	docker tag #### ####
docker:
	docker run -p 5901:5901 -v $(pwd):/data --rm -it f5 bash
ready:
	bash -c "echo -e '123456\n123456\nn' | vncpasswd"
	ln -s /data/Xresources /root
	ln -s /data/tiger.sh /root
	ln -s /data/Xvnc-session /root/.vnc


