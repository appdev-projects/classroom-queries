FROM gitpod/workspace-full
MAINTAINER Jelani Woods <jelani@firstdraft.com>

USER root

USER gitpod
ENV HOME=/home/gitpod

WORKDIR $HOME

RUN curl -o .setup.sh https://raw.githubusercontent.com/appdev-projects/classroom-queries/master/.setup

RUN pwd

RUN ls -a

RUN .$HOME/.setup.sh

