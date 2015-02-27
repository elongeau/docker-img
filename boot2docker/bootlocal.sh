#/bin/bash
PROJECTS='/home/docker/projects'
VIM='/home/docker/vimHost'
mkdir $PROJECTS
mkdir $VIM
sudo mount -t vboxsf -o uid=1000,gid=50 projects $PROJECTS
sudo mount -t vboxsf -o uid=1000,gid=50 vim $VIM 
cd $PROJECTS
chmod +x $PROJECTS/run-scala.sh
