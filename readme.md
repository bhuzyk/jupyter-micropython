# jupyter-micropython

Docker compose for the Scientific Jupyter Notebook Python Stack (https://github.com/jupyter/docker-stacks) with micropython integration (https://github.com/Josverl/micropython-magic)
 

On Windows, share the USB port with usbipd
```
> usbipd bind -b 2-1

> usbipd attach --auto-attach --wsl Ubuntu --busid 2-1 
```
  
```
> docker compose up -d

> docker compose down
```

Created using these initial commands
```
# To build
> docker build -t test:latest . 

# To run
> docker run -it -p 8888:8888 -e GRANT_SUDO=yes --user root --device=/dev/ttyACM0 -v "$(pwd):/home/jovyan/work"  test start-notebook.sh --NotebookApp.token=''
```
