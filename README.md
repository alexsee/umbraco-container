# Umbraco 9 Docker Container Image
This repository provides a simple untouched Umbraco project template with build scripts for docker images.

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
