# Umbraco 12 Docker Image &middot; [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE.md) [![Docker Image CI](https://github.com/alexsee/umbraco-container/actions/workflows/docker-image.yml/badge.svg)](https://github.com/alexsee/umbraco-container/actions/workflows/docker-image.yml)

This repository provides a simple Umbraco project template with build scripts for docker images.
You can run your Umbraco instance as a docker container with easy upgrade capabilities (i.e., just exchange the image).

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
    entrypoint: ["dotnet", "UmbracoContainer.dll", "--urls", "http://0.0.0.0"]
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

**Note**: The docker-compose example maps the entire `wwwroot` folder to a local folder / docker volume. This can lead to issues since the container will also contain important files for Umbraco to work under this folder. Therefore, only include additional folders and files here such as the `css`, `media`, or `scripts` folders separately.
