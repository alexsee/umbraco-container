

# Imagen de Docker para Umbraco 17 &middot; [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE.md) [![Docker Image CI](https://github.com/alexsee/umbraco-container/actions/workflows/docker-image.yml/badge.svg)](https://github.com/alexsee/umbraco-container/actions/workflows/docker-image.yml)

Este repositorio proporciona una plantilla simple de proyecto Umbraco con scripts de compilación para imágenes de Docker.
Puedes ejecutar tu instancia de Umbraco como un contenedor de Docker con capacidades de actualización sencillas (es decir, simplemente sustituye la imagen).

## Paquetes adicionales instalados
* uSync
* Skybrud.Umbraco.Redirects

## Ejemplo de docker-compose.yml
```
version: '3.7'

services:
  umbraco-container:
    container_name: my-umbraco-container
    image: ghcr.io/alexsee/umbraco-container:latest
    user: app
    restart: always
    ports:
      - "8080:8080"
    volumes:
      - ./Logs:/output/umbraco/Logs
      - ./uSync:/output/uSync
      - ./Views:/output/Views
      - ./wwwroot/css:/output/wwwroot/css
      - ./wwwroot/fonts:/output/wwwroot/fonts
      - ./wwwroot/media:/output/wwwroot/media
      - ./appsettings.json:/output/appsettings.json
      - ./Data:/output/umbraco/Data
```

**Nota**: El ejemplo de docker-compose mapea las subcarpetas relevantes de `wwwroot` a una carpeta local o volumen de Docker de forma individual. Si incluyes todo el directorio `wwwroot`, esto puede provocar problemas de actualización, ya que la imagen del contenedor en sí contiene el directorio `wwwroot/umbraco`. Por lo tanto, incluye únicamente carpetas y archivos adicionales aquí, como las carpetas `css`, `media` o `scripts`, de manera separada.

**Nota**: La imagen de Docker está diseñada para ejecutar la aplicación con el usuario `app`, el cual necesita acceso a las carpetas respectivas que se montan. Usa `sudo chown -R 1654:1654 ...` para cambiar la propiedad de los archivos en consecuencia.
