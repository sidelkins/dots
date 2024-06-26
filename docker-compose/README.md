# Docker Compose

## Using a Docker Compose file

The standard for naming the files is `docker-compose.yml` and then running said file with `docker compose up -d`. A custom file can be run with `docker compose -f custom-compose.yml up`

Using a custom filename makes it easier to utilize the same `.env` file across multiple services.

### Start a service or stack

`sudo docker compose --env-file .env -f [FILENAME].yml up -d`

### *arr Suite
`sudo docker compose -p arr --env-file .env -f arr.yml up -d`

### Code Server
Customized Dockerfile from Linuxserver.io to include Node.
From code-server directory, run `sudo ./Script.sh` (may need `chmod +x`)