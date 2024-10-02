# Use the official GitHub Actions runner image as the base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    jq \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a user for the runner
RUN useradd -m runner && echo "runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the runner user
USER runner
WORKDIR /home/runner

# Download and install the GitHub Actions runner
RUN mkdir actions-runner && cd actions-runner \
    && curl -o actions-runner-linux-x64-2.285.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.285.0/actions-runner-linux-x64-2.285.0.tar.gz \
    && tar xzf ./actions-runner-linux-x64-2.285.0.tar.gz

# Add the runner startup script
COPY setup-runner.sh /home/runner/actions-runner/setup-runner.sh

# Move the .env file to the runner's home directory
COPY .env /home/runner/actions-runner/.env

# Make the script executable
RUN /bin/sh /home/runner/actions-runner/setup-runner.sh