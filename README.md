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
Para el primer paso se utilizo el framework de Flask que nos permite crear una api rest para la utilizacion cliente-servidor
con peticiones post y get, con la intencion de ser consumidos, utilizamos un index para exponer el modelo mas optimo para este problema,
fue almacenado y cargado de forma serializada con pickle.


2. Automatizar el proceso de construcción y despliegue de la API, utilizando uno o varios servicios cloud.

Para la contruccion de nuestra api y jupyter notebook fue realizada con docker, 
se automatizaron procesos de guardado de nuestro notebook y algunos archivos en github en nuestro respositorio en la rama develop.

3. Hacer pruebas de estrés a la API con el modelo expuesto con al menos 50.000 requests durante 45
segundos.

Se utilizo wrk para el estrés de la API y realizamos 3 pruebas distintas a la ruta localhost:5000 de nuestra api, con thear de wrk de 1,3,6 para concluir
con una discucion de los resultados.




a. ¿Cómo podrías mejorar el performance de las pruebas anteriores?
Las pruebas se podrian mejorar automatizando este proceso y guardando estos parametros obtenidos por la estres realizada a la api.


 5. ¿Cuáles serían los mecanismos ideales para que sólo sistemas autorizados puedan acceder a esta API?

Seria mediante LDAP, en las dos ultimas oportunidades de trabajo ocupan este sistema y verifica solo con las personas de la empresa de forma segura.

a. ¿Este mecanismo agrega algún nivel de latencia al consumidor? ¿Por qué?

A mi prejuicio si, pero en primera ocacion se debería implemenmtar LDAP y obtener metricas que validen si agrega algun nivel de latencia.

6. ¿Cuáles serían los SLIs y SLOs que definirías y por qué?
SLOs las definiria en primera instancia seria mapear nuestros objetivos alcansables, luego controlar nuestra SLO priorisando las tareas de acuerdo a efectuar las necesidades del cliente. En las SLI evalúa el cumplimiento de un SLO, por ejemplo para ver cuanto tiempo estaran disponibles nuestros sistemas, cumpliendo o superando las promesas realizada en els documento. 


## Instructivo despliegue de ambiente.

git clone repo.
cd repo
cd terraform
install terraform 
ejecutar
terraform intit

# Nuestro ambientes:

Jupyter notebook =
API =

Se ejecuta la pagina web de jupyter nobtebook localhost:8881 con el fin de guardar el mejor modelo automatico de pickle de forma serializada.

Luego se puede probar de deacuerdo las variables que son 36, estimando con el modelo en localhost:5000, como se visualiza en la siguente imagen.

Por ultimo se efecutaron pruebas estimando, si el avion llega tarde o no de acuerdo a las variables mensionadas anteriormente.









