FROM gitpod/workspace-full
MAINTAINER Jelani Woods <jelani@firstdraft.com>

USER root

USER gitpod
ENV HOME=/home/gitpod

WORKDIR $HOME

ADD https://raw.githubusercontent.com/appdev-projects/classroom-queries/master/.setup $HOME

RUN ./.setup.sh
