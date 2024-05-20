# Docker Compose

## Using a Docker Compose file

The standard for naming the files is `docker-compose.yml` and then running said file with `docker compose up -d`. A custom file can be run with `docker compose -f custom-compose.yml up`

Using a custom filename makes it easier to utilize the same `.env` file across multiple services.

### *arr Suite
`sudo docker compose -p arr --env-file .env -f arr.yml up`
For these you may have to exit and start from Portainer