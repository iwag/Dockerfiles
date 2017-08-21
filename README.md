Dockerfiles
===========

Dockerfile okiba

* docker build -t iwag/centos-all .

How to set up docker environment in Mac
=====

I often totally forget about how to setup docker in Mac because I erase docker environment since I don't use it for auite a while.
Anyway keep it on my note about the instructions.
before this instruction, make sure install virtualbox `brew install docker-machine docker`.

```bash
docker-machine create default
docker-machine start default
eval $(docker-machine env)
docker version
docker run ...
docker-machine stop default
VBoxManage modifyvm "default" --natpf1 "tcp-port53306,tcp,,53306,,53306”;
```

