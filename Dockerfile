FROM node:latest AS base

RUN  sh -c "curl -fsSL https://get.docker.com -o get-docker.sh | sh"

# Build with 'docker build -t builder .'
LABEL org.opencontainers.image.url="https://hub.docker.com/r/rexypoo/builder" \
      org.opencontainers.image.documentation="https://hub.docker.com/r/rexypoo/builder" \
      org.opencontainers.image.source="https://github.com/Rexypoo/docker-builder" \
      org.opencontainers.image.version="0.1a" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.description="Docker builder image" \
      org.opencontainers.image.title="rexypoo/builder" \
