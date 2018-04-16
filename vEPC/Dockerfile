# Use an official Python runtime as a parent image
FROM ubuntu:16.04

# Set the working directory to /app
WORKDIR /root

# Copy the current directory contents into the container at /app
RUN apt-get update -y && \
	apt-get install software-properties-common net-tools iputils-ping vim -y && \
	add-apt-repository ppa:acetcom/nextepc -y && \
	apt-get update -y && \
	sysctl -w net.ipv6.conf.all.disable_ipv6=0 && \
	apt-get install nextepc -y

COPY ./hss.conf /etc/nextepc/

ENTRYPOINT ["/sbin/init"]

