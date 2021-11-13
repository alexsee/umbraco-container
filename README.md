# Umbraco 9 Docker Image &middot; [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE.md) [![Docker Image CI](https://github.com/alexsee/umbraco-container/actions/workflows/docker-image.yml/badge.svg)](https://github.com/alexsee/umbraco-container/actions/workflows/docker-image.yml)

This repository provides a simple Umbraco project template with build scripts for docker images.

## Additional installed packages
* uSync Complete Edition

## Example docker-compose.yml
```
version: '3.7'

services:
  umbraco-container:
    container_name: my-umbraco-container
    image: ghcr.io/alexsee/umbraco-container:latest
    restart: always
    entrypoint: ["/wait-for-it.sh", "host.docker.internal:1433", "-t", "120", "--", "dotnet", "UmbracoContainer.dll", "--urls", "http://0.0.0.0"]
    ports:
      - "80:80"
    volumes:
      - ./App_Plugins:/output/App_Plugins
      - ./Logs:/output/umbraco/Logs
      - ./uSync:/output/uSync
      - ./Views:/output/Views
      - ./wwwroot:/output/wwwroot
      - ./appsettings.json:/output/appsettings.json
```
