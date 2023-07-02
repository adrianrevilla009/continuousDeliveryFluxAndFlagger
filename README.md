# Descripcion de la practica de Adrian Revilla
Se han definido dos directorios, uno para montar los despliegues continuos automatizados mediante flagger, 
y otro usando GitOps usando fluxCD por encima de flagger.

# 6-continuousDeliveryFluxAndFlagger
La metodologia es la siguiente:

- Se define una aplicacion spring que utiliza una mysql
- Se define un dockerfile para generar la imagen de esa aplicacion
- Se definen los deployment y servicios para la app y la bd que utilizan la imagen generada
- Se define el canary.yaml para definir como es el despliegue, el gateway.yaml como punto 
 de entrada para istio, y un latency-metric-template.yaml como metrica custom a capturar

- Se levantan los siguientes contenedores sobre el cluster:
  - Istio
  - Flagger
  - La aplicacion
  - Grafana
  - Prometheus
  - El generador de carga

Una vez levantada la aplicación en el cluster, se realiza una modificación de version,
se lanza el canary y se capturan las metricas las cuales visualizamos en el grafana

# 7-continuousDeliveryFluxAndFlaggerGitOps
La metodologia es la siguiente:

- Se instala fluxCD en el sistema y genera un repositorio privado en mi cuenta de github
- Se definen los deployment y servicios para la app y la bd que utilizan la imagen generadas anteriormente
- Se define un kustomization para apuntar a los recursos kubernetes de la app a levantar, y el repositorio al que debe apuntar 
 para verificar los cambios (el anterior repositorio generado para flagger)
- Se definen los recursos para levantar istio y flagger via manifiestos
- Se definen el grafana y la metrica custom via manifiestos

- Se levantan los siguientes contenedores sobre el cluster:
    - Istio
    - Flagger
    - La aplicacion
    - Grafana
    - Prometheus
    - El generador de carga

Una vez levantada la aplicación en el cluster, se realiza una modificacion en la version de la aplicacion,
se hace un reconcile y se flux lanza el canary y se capturan las metricas las cuales visualizamos en el grafana




Mas informacion recolectada en el siguiente documento:
https://docs.google.com/document/d/1pPVxeo_S2ChOjCxbWEuP7BAYD7llS6xwy1h1ROu9uBU/edit?usp=sharing




