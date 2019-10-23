FROM gitpod/workspace-full
MAINTAINER Jelani Woods <jelani@firstdraft.com>

USER root

USER gitpod
ENV HOME=/home/gitpod

WORKDIR $HOME

RUN mkdir $HOME/tmp-home
COPY Gemfile $HOME/tmp-home/

RUN cd $HOME/tmp-home && bundle install
