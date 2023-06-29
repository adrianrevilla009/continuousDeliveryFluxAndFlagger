# Imagen base para el contenedor de compilación
# Necesitamos tener los archivos protobuf obtenidos de /target de la compilacion
FROM maven:3.9.0-eclipse-temurin-17 as builder
WORKDIR /continuousDeliveryFluxAndFlagger/flagger
COPY /src /continuousDeliveryFluxAndFlagger/flagger/src
COPY pom.xml /continuousDeliveryFluxAndFlagger/flagger
RUN mvn -B clean package -DskipTests

# Imagen base para el contenedor de la aplicación
FROM eclipse-temurin:17-jdk
WORKDIR /usr/src/app/
COPY --from=builder /continuousDeliveryFluxAndFlagger/flagger/target/*.jar /usr/src/app/

EXPOSE 8881
CMD [ "java", "-jar", "library-1.0.0.jar" ]
