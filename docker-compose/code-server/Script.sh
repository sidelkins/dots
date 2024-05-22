#!/bin/bash

# Linuxsercer.io Code-Server Repo
REPO_LINK=https://github.com/linuxserver/docker-code-server/

echo "Cloning Repo..."

git clone $REPO_LINK

echo "Copying root to this directory..."

cp -r docker-code-server/root ./


# Build and start with Docker Compose

echo "Building and starting container"

docker compose up -d

echo "Cleaning up..."

rm -r docker-code-server root

echo "Done!"
