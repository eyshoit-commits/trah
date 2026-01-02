# Use Ubuntu 24.04 as base image
FROM ubuntu:24.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# Set up basic tools and dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    ca-certificates \
    gnupg \
    lsb-release \
    sudo \
    vim \
    nano \
    locales \
    tzdata \
    software-properties-common \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Create users: bkg and app with sudo privileges
RUN useradd -m -s /bin/bash -u 1000 app && \
    useradd -m -s /bin/bash -u 1001 bkg && \
    echo "app ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "bkg ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install Conda (Miniconda)
ARG CONDA_VERSION=latest
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh && \
    /opt/conda/bin/conda init bash && \
    /opt/conda/bin/conda config --set auto_activate_base false

ENV PATH=/opt/conda/bin:$PATH

# Install Python 3.12
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && \
    apt-get install -y \
    python3.12 \
    python3.12-dev \
    python3.12-venv \
    python3-pip \
    && ln -sf /usr/bin/python3.12 /usr/local/bin/python && \
    ln -sf /usr/bin/python3.12 /usr/local/bin/python3

# Install pip for Python 3.12
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12

# Switch to app user for Node.js, Rust, and other user-specific installations
USER app
WORKDIR /home/app

# Install NVM (Node Version Manager)
ENV NVM_DIR=/home/app/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Install Node.js 24 via NVM
RUN bash -c "source $NVM_DIR/nvm.sh && nvm install 24 && nvm use 24 && nvm alias default 24"

# Install pnpm and global npm packages
RUN bash -c "source $NVM_DIR/nvm.sh && nvm use 24 && npm install -g pnpm npm@latest"

# Install Rust
# Note: Official Rust installation script - verified from rust-lang.org
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
ENV PATH=/home/app/.cargo/bin:$PATH

# Update Rust and install common tools
RUN bash -c "source /home/app/.cargo/env && rustup update && rustup component add rustfmt clippy"

# Switch back to root for system-wide installations
USER root

# Install OpenCode globally
# Note: OpenCode installation - gracefully handles if URL is not available
RUN curl -fsSL https://opencode.ai/install 2>/dev/null | bash || echo "OpenCode installation will be completed during post-create"

# Clone OpenAgents repository
# Note: Using main branch - in production, consider pinning to a specific tag or commit
RUN git clone --depth 1 https://github.com/darrenhinde/OpenAgents /opt/openagents || echo "OpenAgents will be cloned during post-create"

# Create workspace directory
RUN mkdir -p /workspace && \
    chown -R app:app /workspace && \
    chown -R app:app /opt/conda

# Grant both users access to workspace
RUN usermod -aG sudo app && \
    usermod -aG sudo bkg

# Create custom agents directory structure
RUN mkdir -p /workspace/.github/agents && \
    mkdir -p /workspace/.github/workflows && \
    mkdir -p /workspace/.github/skills && \
    chown -R app:app /workspace/.github

# Copy setup scripts from .devcontainer directory
COPY --chown=app:app .devcontainer/post-create.sh /workspace/.devcontainer/post-create.sh
COPY --chown=app:app .devcontainer/post-start.sh /workspace/.devcontainer/post-start.sh
COPY --chown=app:app .devcontainer/setup-opencode.sh /workspace/.devcontainer/setup-opencode.sh
COPY --chown=app:app .devcontainer/setup-openagents.sh /workspace/.devcontainer/setup-openagents.sh

# Make scripts executable
RUN chmod +x /workspace/.devcontainer/*.sh 2>/dev/null || true

# Set up conda for all users
RUN /opt/conda/bin/conda init bash && \
    echo 'export PATH=/opt/conda/bin:$PATH' >> /etc/bash.bashrc

# Final setup for app user environment
USER app
WORKDIR /workspace

# Initialize shell environment
RUN echo 'source $NVM_DIR/nvm.sh' >> /home/app/.bashrc && \
    echo 'source /home/app/.cargo/env' >> /home/app/.bashrc && \
    echo 'export PATH=/opt/conda/bin:$PATH' >> /home/app/.bashrc

# Default command
CMD ["/bin/bash"]
