FROM gitpod/workspace-full
MAINTAINER Jelani Woods <jelani@firstdraft.com>

USER root

USER gitpod
ENV HOME=/home/gitpod

WORKDIR $HOME

RUN curl -o $HOME/.setup https://raw.githubusercontent.com/appdev-projects/classroom-queries/master/.setup

RUN pwd

RUN ls

RUN ./.setup.sh

