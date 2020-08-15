# starting docker

On remote node running docker

```bash
docker run -p 5901:5901 -v $(pwd):/data --rm -it <image> bash
```

# starting vncserver

In docker bash run to start vncserver

```bash
tiger.sh
```

# tunneling

If you need ssh tunneling to your container

```bash
node=<node-running-docker-or-singularity>
user=<username>
gateway=<gateway>
cmd="ssh ${user}@${gateway} -L5901:${node}:5901"
echo $cmd
$cmd
```

# connecting to server

In local

```bash
vncviewer :1
```

# starting tint2

In your vnc session

```bash
tint2
```

# kill your server

This can be done either on the bash from ~docker run~
or you can do it within the container itself.

```bash
vncserver -kill :1
```

