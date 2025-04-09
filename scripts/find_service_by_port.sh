#!/bin/bash

# Check if a port number is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <port-number>"
  exit 1
fi

# Get the port number from input
PORT=$1

# Use lsof to find the service running on the port
SERVICE=$(sudo lsof -iTCP:$PORT -sTCP:LISTEN -Pn | awk 'NR==2 {print $1}')

# Check if any service is found
if [ -z "$SERVICE" ]; then
  echo "No service found running on port $PORT."
else
  echo "Service running on port $PORT: $SERVICE"
fi
