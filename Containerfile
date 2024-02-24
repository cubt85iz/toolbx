# Update static references to major version in configurations
FROM registry.fedoraproject.org/fedora-toolbox:39

# Variables
ARG CONFIG=${CONFIG:-}

# Apply updates containing bug and security fixes.
RUN dnf -y upgrade-minimal \
  && dnf -y install jq

# Copy environment file to image
COPY .config/$CONFIG /tmp/

# Copy scripts to image
COPY scripts/*.sh /tmp/

# If necessary, install provided repositories
RUN /tmp/install-repos.sh \
  && /tmp/install-packages.sh \
  && rm -rf /tmp/*
