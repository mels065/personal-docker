FROM ubuntu:14.04

MAINTAINER Brandon Mellus <mellusbrandon@gmail.com>

# Follows instructions from Digital Ocean guide:
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-getting-started

# Installs packages

RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get install linux-image-extra-`uname -r`
RUN apt-get install sed

# Add Docker Repo Key
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add Docker Repo
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list

# Update Repo
RUN apt-get update

# Install Docker
RUN apt-get install docker-engine

# UFW
# RUN sed 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/' /etc/default/ufw
# RUN ufw reload

# Run Docker
RUN docker daemon &

#CMD ["/usr/bin/nodejs"]