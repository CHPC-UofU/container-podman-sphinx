# syntax=docker/dockerfile:1

# Global image args:
ARG pythonversion="x.x.x"

# Base Image:
FROM docker.io/python:${pythonversion}-alpine

# Change working directory:
WORKDIR /tmp

# Install extra system packages
RUN apk add --no-cache \
    make

# Copy necessary files:
COPY ./requirements.txt /tmp/requirements.txt

# Install extra Python packages:
RUN pip3 install -r /tmp/requirements.txt

# Cleanup
RUN rm /tmp/requirements.txt
