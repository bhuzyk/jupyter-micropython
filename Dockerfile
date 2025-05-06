FROM quay.io/jupyter/scipy-notebook
WORKDIR /home/jovyan/work

USER root
ENV GRANT_SUDO=yes

RUN sudo usermod -a -G tty jovyan
RUN sudo usermod -a -G dialout jovyan
RUN sudo usermod -a -G tty root
RUN sudo usermod -a -G dialout root

RUN pip install -U "micropython-magic" --root-user-action ignore

EXPOSE 8888