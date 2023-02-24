ARG CODE_VERSION=17-jdk-alpine

FROM eclipse-temurin:${CODE_VERSION}

LABEL br.com.morsesystems.image.authors="Diego Campos kamposdiego@outlook.com"

ENV LOG_DIR /logs

RUN apk add --no-cache bash

EXPOSE 8888

ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} config-server.jar

ENTRYPOINT ["java","-XX:+UseSerialGC","-XX:MaxRAM=80m","-jar","config-server.jar"]
