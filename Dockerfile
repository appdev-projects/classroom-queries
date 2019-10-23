FROM gitpod/workspace-full
LABEL maintainer="jelani@firstdraft.com"

USER root

USER gitpod
ENV HOME=/home/gitpod

WORKDIR $HOME

RUN curl -o .setup.sh https://raw.githubusercontent.com/appdev-projects/classroom-queries/master/.setup

RUN chmod 775 .setup.sh

RUN ./.setup.sh
