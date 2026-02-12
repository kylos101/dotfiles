FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

RUN --mount=type=secret,id=FOO_TOKEN,env=FOO_TOKEN \
    cat $FOO_TOKEN > /workspaces/foo_envvar.txt

RUN --mount=type=secret,id=/usr/local/secrets/foo,target=/tmp/foo_token.txt \
    cat /tmp/foo_token.txt > /workspaces/foo_token_file.txt

# Install system packages and global dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        curl \
        wget \
        unzip \
        ca-certificates \
        gnupg \
        lsb-release \
    # Install Docker CLI
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get -y install --no-install-recommends docker-ce-cli \
    # Install kubectl
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm kubectl \
    # Install Google Cloud CLI
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends google-cloud-cli \
    # Install AWS CLI
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip \
    # Install Go
    && GO_VERSION="1.21.5" \
    && curl -fsSL "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" -o go.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz \
    && rm go.tar.gz \
    # Clean up to reduce image size
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Add Go to PATH for all users
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/home/vscode/go"
ENV PATH="${GOPATH}/bin:${PATH}"

# Switch to vscode user for user-specific setup
USER vscode

# Create Go workspace directory
RUN mkdir -p /home/vscode/go/{bin,src,pkg}

# Switch back to root (default for MS dev containers)
USER root
