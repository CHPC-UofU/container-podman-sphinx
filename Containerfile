
# Container image build arguments:
ARG podmanversion="x.x.x"

# Base image:
FROM quay.io/podman/stable:v${podmanversion}

# Package installs/updates:
RUN dnf install -y \
      git \
      pip

# Add Pip packages file:
COPY ./requirements.txt /tmp/requirements.txt

# Install Sphinx:
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt

# Clean up extra files:
RUN rm /tmp/requirements.txt

# Override container.conf:
RUN sed -i 's/\(^utsns=\).*/\1\"private\"/' /etc/containers/containers.conf
