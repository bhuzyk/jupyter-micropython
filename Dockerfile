#docker run -it -p 8888:8888 -e GRANT_SUDO=yes --user root --device=/dev/ttyACM0 -v "$(pwd):/home/jovyan/work"  quay.io/jupyter/scipy-notebook

# command line:   -p 8888:8888  --device=/dev/ttyACM0

# To build
# docker build -t test:latest . 
#
# To run
# docker run -it -p 8888:8888 -e GRANT_SUDO=yes --user root --device=/dev/ttyACM0 -v "$(pwd):/home/jovyan/work"  test start-notebook.sh --NotebookApp.token=''

FROM quay.io/jupyter/scipy-notebook
WORKDIR /home/jovyan/work

USER root
ENV GRANT_SUDO=yes

RUN sudo usermod -a -G tty jovyan
RUN sudo usermod -a -G dialout jovyan
RUN sudo usermod -a -G tty root
RUN sudo usermod -a -G dialout root

RUN pip install -U "micropython-magic" --root-user-action ignore

#RUN start-notebook.sh --NotebookApp.token=''


EXPOSE 8888