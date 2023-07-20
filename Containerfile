# syntax=docker/dockerfile:1

# Global image args:
ARG pythonversion="x.x.x"

# Base Image:
FROM docker.io/python:${pythonversion}-alpine

# Change working directory:
WORKDIR /tmp

# Install extra system packages
RUN apk add --no-cache \
    make=4.3-r0

# Copy necessary files:
COPY ./requirements.txt .

# Install extra Python packages:
RUN pip3 install -r ./requirements.txt

# Change working directory:
WORKDIR /docs

# Ports:
EXPOSE 8000

# Volumes:
VOLUME [ "/docs" ]

# Run once the container has started:
ENTRYPOINT [ "make" ]
