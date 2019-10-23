FROM gitpod/workspace-full
MAINTAINER Jelani Woods <jelani@firstdraft.com>

USER root

USER gitpod
ENV HOME=/home/gitpod

WORKDIR $HOME

COPY .setup.sh $HOME

RUN ./.setup.sh

