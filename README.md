# walmart-stack
1. Tomar en consideración que para levantar la aplicación se debe configurar la variable de entorno {ROOT_DIR_SF}, la cual debe contener la ruta donde estara el proyecto walmart.
2. En la ruta configurada en {ROOT_DIR_SF} se debe crear una carpeta con nombre walmart.
3. En la ruta {ROOT_DIR_SF}/walmart se hace git clone de los siguientes repositorios:
    a. https://github.com/sabeliaruiz/walmart-ui
    b. https://github.com/sabeliaruiz/walmart-stack
    c. https://github.com/sabeliaruiz/walmart-api
4. En la ruta configurada en {ROOT_DIR_SF}/walmart se debe crear un carpeta con nombre.
5. Se debe construir la imagenes en la raíz de cada proyecto:
    a. walmart-ui => docker build -t walmart-ui .
    b. walmart-api => docker build -t walmart-api .
    c. walmart-stack => docker build -t mongo .
6. Para levantar el stack se debe ejecutar el siguiente comando en la raiz del proyecto walmart-stack, docker stack deploy -c walmart-stack-local.yml walmart
7. Para importar la base de datos se debe realizar los siguientes pasos:
    a. Obtener el nombre del container donde se desplego mongo, docker container ls
    b. Copiar el archivo products dentro del contenedor, docker cp ./products.json  NOMBRE_CONTAINER:/products.json (este comando se debe ejecutar en la raiz del proyecto walmart-stack).
    c. Entrar al container de mongo, docker exec -it NOMBRE_CONTAINER /bin/sh
    d. Dentro del container ejecutar el comando de import: mongoimport --uri=mongodb://172.17.0.1:27017 --collection=products --db=walmart --file=./products.json

La url de ui es => http://172.17.0.1:3031/
El servicio get expuesto por el micro servicio se puede probar desde postman con el siguiente curl:
curl --location --request GET '172.17.0.1:3030/walmart/v1/products?value=adda'