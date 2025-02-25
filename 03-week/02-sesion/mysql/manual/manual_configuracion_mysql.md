
# Manual para Configuración de Contenedor MySQL

Este manual describe los pasos para configurar y levantar un contenedor MySQL utilizando Docker y Docker Compose. Se incluyen los archivos `.env`, `Dockerfile` y `docker-compose.yml` necesarios para la configuración.

## 1. Archivo .env

El archivo `.env` contiene las variables de entorno necesarias para la configuración del contenedor. Asegúrese de configurar los valores según sus necesidades.

```env
MYSQL_ROOT_PASSWORD=abcd1234
```

## 2. Dockerfile

El `Dockerfile` es utilizado para crear una imagen personalizada de MySQL que incluye la instalación de herramientas adicionales.

```dockerfile
# Dockerfile for MySQL with locale configuration
# Author: [Jesús Ariel González Bonilla]
# Date: [21-06-2024]

FROM mysql:latest

# Set environment variable
ENV LANG es_ES.UTF-8
```

## 3. docker-compose.yml

El archivo `docker-compose.yml` se utiliza para definir y configurar los servicios que se levantarán en los contenedores. Este archivo hace uso de las variables definidas en el archivo `.env`.

```yaml
version: '3.8'
services:
  mysql:
    container_name: serve-mysql
    build:
      context: .
      dockerfile: Dockerfile
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
    ports:
      - "3306:3306"
    networks:
      - network_local_server
    volumes:
      - mysql_data:/var/lib/mysql
      - "/home/ubuntu/db_backups:/backups/mysql"
    healthcheck:
      test: ["CMD-SHELL", "mysqladmin ping -h localhost"]
      interval: 30s
      timeout: 10s
      retries: 5
    labels:
      - com.corhuila.group=databases
volumes:
  mysql_data:
    driver: local
networks:
  network_local_server:
    driver: bridge
    name: network_local_server
```

## 4. Pasos para la Configuración

1. **Preparar los Archivos**
   - Coloque los archivos `.env`, `Dockerfile` y `docker-compose.yml` en el mismo directorio.

2. **Construir la Imagen**
   - Utilice el siguiente comando para construir la imagen a partir del `Dockerfile`:
     ```sh
     docker build -t custom-mysql .
     ```

3. **Levantar el Contenedor**
   - Si desea actualizar la configuración o reconstruir la imagen, primero detenga el contenedor con el siguiente comando:
     ```sh
     docker-compose down
     ```
   - Luego, levante el contenedor y reconstruya la imagen utilizando:
     ```sh
     docker-compose up -d --build
     ```

4. **Acceso a MySQL**
   - Después de que el contenedor esté en ejecución, puede acceder a MySQL utilizando el cliente MySQL o cualquier otra herramienta de administración de bases de datos compatible.

## 5. Notas Adicionales

- Asegúrese de que Docker y Docker Compose estén instalados correctamente en su sistema antes de comenzar.
- Puede personalizar los archivos según los requisitos específicos de su proyecto.

