# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

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
