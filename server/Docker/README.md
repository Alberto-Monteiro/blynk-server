# Blynk Server Docker Image

Runs your own [Blynk Server](https://github.com/alberto-monteiro/blynk-server) in a Docker container instead of relying on Blynk's public server.

[Blynk](http://www.blynk.cc) is the "first drag-n-drop IoT app builder for Arduino, Raspberry Pi, ESP8266, ESP32, SparkFun boards, and others." Super fun.

## How To Use It

Easy peasy:

```sh
docker run rocksdf/blynk-server:latest
```

To forward IP ports from the host to the container, do this:

```sh
docker run -p 8080:8080 -p 8441:8441 -p 9443:9443 rocksdf/blynk-server:latest
```

To persist data, mount a directory into the container:

```sh
docker run -v $(PWD):/data rocksdf/blynk-server:latest
```

To include your own server.properties file, mount it into /config/server.properties

```sh
docker run -v $(PWD)/server.properties:/config/server.properties rocksdf/blynk-server:latest
```

Example of use in docker-compose, you do not need to edit the .properties files
```yaml
version: '3.9'
services:
  blynk:
    container_name: blynk
    image: rocksdf/blynk-server:latest
    environment:
      - BLYNK_SERVER_VERSION=0.41.16
      - ADMIN_EMAIL=admin@blynk.cc
      - ADMIN_PAS=admin
      - MAIL_SMTP_USERNAME=mail@gmail.com
      - MAIL_SMTP_PASSWORD=pass
    volumes:
      - /DockerVolume/blynk/data:/data
      - /DockerVolume/blynk/data/backup:/data/backup
      - /DockerVolume/blynk/config:/config
    restart: always
    ports:
      - 80:8080
      - 443:9443
```

Or you can use a data volume in another container (check out different data volume techniques [here](https://docs.docker.com/engine/tutorials/dockervolumes/)).
