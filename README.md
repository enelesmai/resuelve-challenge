# Prueba de Ingeniería Resuelve

> API desarrollada en Ruby on Rails como propuesta de solución para la prueba de backend de [Ingeniería Resuelve](https://github.com/resuelve/prueba-ing-backend)

![image](https://user-images.githubusercontent.com/5160907/111025320-fe5a3080-83a8-11eb-91d6-2f718e33e69f.png)

Se desarrolló bajo el esquema MVC de Ruby on Rails y configurando la aplicación como API only = true, por lo que en este caso no se usan Views.

## Desarrollada, probada, documentada y publicada con los siguientes lenguajes y herramientas

- Ruby 2.6.6,
- Rails 6.1.13,
- Rspec
- Swagger,
- Docker 20.10.5, 
- Travis, 
- Heroku

## Demo

[Click aquí para visitar la versión en `Heroku` de esta API](https://resuelve-challenge.herokuapp.com/api-docs)

* Para probar el endpoint `/payouts` ingresa el [json de request](https://github.com/resuelve/prueba-ing-backend) presentado en las especificaciones de la prueba:

        {
            "jugadores" : [  
                {  
                    "nombre":"Juan Perez",
                    "nivel":"C",
                    "goles":10,
                    "sueldo":50000,
                    "bono":25000,
                    "sueldo_completo":null,
                    "equipo":"rojo"
                },
                {  
                    "nombre":"EL Cuauh",
                    "nivel":"Cuauh",
                    "goles":30,
                    "sueldo":100000,
                    "bono":30000,
                    "sueldo_completo":null,
                    "equipo":"azul"
                },
                {  
                    "nombre":"Cosme Fulanito",
                    "nivel":"A",
                    "goles":7,
                    "sueldo":20000,
                    "bono":10000,
                    "sueldo_completo":null,
                    "equipo":"azul"

                },
                {  
                    "nombre":"El Rulo",
                    "nivel":"B",
                    "goles":9,
                    "sueldo":30000,
                    "bono":15000,
                    "sueldo_completo":null,
                    "equipo":"rojo"

                }
            ]
        }


Repuesta de la API:

![image](https://user-images.githubusercontent.com/5160907/111032832-cfa57f80-83d3-11eb-81bc-263196ef49b5.png)

## Getting Started

Para obtener una copia local y ejecutar sigue los pasos que se describen a continuación.


### Prerequisitos

Es necesario tener instalada la versión 2.6.6 de Ruby para ejecutar la aplicación, se recomienda utilizar algún gestor de versiones de ruby como rvm o rbenv. En este caso utilizamos rvm:

    # Instalar versión requerida
    $ rvm install 2.6.6

Una vez instalado indicar que se desea utilizar esa versión:

    # Usar la versión requerida
    $ rvm use 2.6.6

En caso de no tener rvm instalado, seguir la [documentación oficial para instalar](https://rvm.io/rvm/install), según el sistema operativo que se maneje.


### Setup

Clonar este repositorio en la máquina local:

    # Clonar el repositorio
    $ git clone git@github.com:enelesmai/resuelve-challenge.git


### Instalación

Ejecutar los siguientes comandos para instalar dependencias

    # Instalar bundle
    $ gem install bundle

    # Instalar gemas utilizadas y dependencias
    $ bundle install


### Información de Uso

Escribir el siguiente comando para iniciar la aplicación

    # Iniciar el servidor local
    $ rails s

La aplicación cuenta con dos endpoints: `/configs` es meramente informativo, mostrará un ejemplo de objeto de configuración y `/payouts` es el endpoint que procesa los datos según lo solicitado en la prueba.

Revisar la documentación para conocer la estructura de los datos que se consumen y/o se producen con estos endpoint.

Para acceder a la documentación en el entorno local visite el siguiente enlace:

    [http://localhost:3000/api-docs/index.html](http://localhost:3000/api-docs/index.html)

o en `Heroku`:

    [https://resuelve-challenge.herokuapp.com/api-docs](https://resuelve-challenge.herokuapp.com/api-docs)


### Ejecutar Pruebas

Este proyecto tiene dos tipos de tests, algunos de ellos escritos para generar la documentación de `Swagger`, son los referentes a los endpoints visibles. Para correr esos tests se ejecuta el siguiente comando sobre en ambiente TEST:

    $ RAILS_ENV=test rails rswag

Los test de Rspec se utilizaron para escribir los casos y validaciones de los modelos y el servicio desarrollados, ejecutar con el siguiente comando:

    $ rspec


### Documentación

La documentación se generó utilizando la herramienta swagger, los test que generaron esta documentación se encuentran en los archivos listados a continuación:
* spec/requests/api/configs_spec.rb
* spec/requests/api/payouts_spec.rb

en caso de realizar cambios en el esquema/objeto que se va a recibir o de actualizar descripciones se debe correr el siguiente comando para que la documentación se actualice:

    # Generar documentación rswag
    $ rake rswag:specs:swaggerize


### Docker

Para ejecutar la aplicación utilizando docker se debe tener instalado Docker en el equipo. Instalar la versión desde [Docker Hub](https://docs.docker.com/get-docker/), siguiendo las isntrucciones según el sistema operativo correspondiente.
Si deseas crear un contenedor de 0 puedes revisar el siguiente repositorio [docker-container-for-ror](https://github.com/enelesmai/docker-container-for-ror).

Para levantar el servicio con docker escribir el siguiente comando:

    $ docker-compose up -d

Para verificar que ha funcionado correctamente visitar la liga local:

    http://localhost:3000/


## 🤝 Trabajo Futuro

La prueba contiene un Bonus para ingresar configuraciones a través de un parámetro, para lo cual ya está preparada la aplicación. Como trabajo futuro se deben escribir los tests correspondientes a dicha funcionalidad y cubrir posibles casos de excepción.


## Autora

👤 **Xóchitl Selene Flores Pérez**

- Github: [@enelesmai](https://github.com/enelesmai)
- Twitter: [@enelesmai](https://twitter.com/enelesmai)
- Linkedin: [in/xochitlselene](https://linkedin.com/in/xochitlselene)


## 🤝 Contribuciones

Contribuciones, defectos y solicitud de nuevas funcionalidades ¡son bienvenidas!

Siéntete libre de reportar o revisar la sección de [issues](issues/).


## Muestra tu apoyo ;)

Dame una ⭐️ si te gusta este proyecto!


## Agradecimientos

- A Ingeniería Resuelve por este reto
- Inspiración
- Familia <3
