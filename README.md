# SRE-chanllenge

#Prueba tecnica Chanllenge, Devops
# El Problema:
Se ha proporcionado un cuaderno jupyter notebook que contiene el trabajo de un Data Scientist y ML Engineer.

– El problema que trató de resolver el DS fue predecir la probabilidad de atraso de los vuelos que aterrizan o
despegan del aeropuerto de Santiago de Chile (SCL). Para eso utilizó un dataset de datos públicos y reales
donde cada fila corresponde a un vuelo que aterrizó o despegó de SCL.
– Para cada vuelo se cuenta con la siguiente información:

Como SRE Engineer, tu desafío consiste en tomar el trabajo del equipo, exponerlo para que sea explotado por un
sistema:

1. Exponer el modelo serializado a través API REST.


Para el primer paso se utilizo el framework de Flask que nos permite crear una api rest para la utilizacion cliente-servidor como se muestra en la sigeunte imagen, con peticiones post y get, con la intencion de ser consumidos, utilizamos un index para exponer el modelo mas optimo para este problema,
fue almacenado y cargado de forma serializada con pickle.

<p align="center">
  <img width="500" height="200" src="imagenes/UML-13.png">
</p>

2. Automatizar el proceso de construcción y despliegue de la API, utilizando uno o varios servicios cloud.

Para la contruccion de nuestra api y jupyter notebook fue realizada con docker, en donde
se automatizaron procesos de guardado de nuestro notebook y algunos archivos en github en nuestro respositorio en la rama develop.
Luego que podiamos implementarlo de forma local se dessarollo atraves de Terraform con el fin de obtener nuestro repositorio automatizado.

3. Hacer pruebas de estrés a la API con el modelo expuesto con al menos 50.000 requests durante 45
segundos.

Se utilizo wrk para el estrés de la API y realizamos 3 pruebas distintas a la ruta localhost:5000 de nuestra api, con thear de 1, 3 y 6. 

Prueba de estres a la API nº1
<p align="center">
  <img width="500" height="200" src="imagenes/1.png">
</p>
Prueba de estres a la API nº2
<p align="center">
  <img width="500" height="200" src="imagenes/3.png">
</p>
Prueba de estres a la API nº3
<p align="center">
  <img width="500" height="200" src="imagenes/6.png">
</p>

Ya que solo nos permitio con estos parametros en la pruebas, se deduce que se obtienen parametros simelares, pero la que contiene 3 thread se logra obtener menos segundos en AVG de latencia, notamos que en primera imagen que contiene 1 thread los resultados de desviacion estándar de latencia son menores.



a. ¿Cómo podrías mejorar el performance de las pruebas anteriores?

Las pruebas se podrian mejorar automatizando este proceso y guardando estos parametros obtenidos por la estres realizada a la API.


 5. ¿Cuáles serían los mecanismos ideales para que sólo sistemas autorizados puedan acceder a esta API?

Seria mediante LDAP, en las dos ultimas oportunidades de trabajo ocupan este sistema y verifica solo con las personas de la empresa de forma segura.

a. ¿Este mecanismo agrega algún nivel de latencia al consumidor? ¿Por qué?

A mi prejuicio si, pero en primera ocacion se debería implemenmtar LDAP y obtener metricas que validen si se agrega algun nivel de latencia, luego analizar y discutir los datos.

6. ¿Cuáles serían los SLIs y SLOs que definirías y por qué?
SLOs las definiria en primera instancia seria mapear nuestros objetivos alcansables, luego controlar nuestra SLO priorisando las tareas de acuerdo a efectuar las necesidades del cliente. En las SLI evalúa el cumplimiento de un SLO, por ejemplo para ver cuanto tiempo estaran disponibles nuestros sistemas, cumpliendo o superando las promesas realizada en els documento. 


## Instructivo despliegue de ambiente.

1. `git clone https://github.com/Rodrigomontenegrofarias/SRE-chanllenge.git`
2. `cd SRE-chanllenge`
3. `cd terraform`
4. `install terraform`
5. `ejecutar terraform init`
6. `ejecutar terraform validate`
7. `ejecutar terraform apply`


# Nuestro ambientes estaran alojados en los siguientes Link:

1. [API](https://localhost:5000)

2. [Notebook Jupyter](https://localhost:8881)

Se ejecuta la pagina web de jupyter nobtebook  con el fin de guardar el mejor modelo automatico de pickle de forma serializada. Luego se puede probar el modelo de deacuerdo las variables que son 36, estimando con el modelo en localhost:5000, como se visualiza en el siguente video.



https://user-images.githubusercontent.com/59695256/200410471-d3cdb85f-834b-4110-94e4-d5a413e8e695.mp4


Por ultimo se efecutaron pruebas estimando, si el avion llega tarde o no de acuerdo a las variables mensionadas anteriormente, que logran predecir correctamente.







