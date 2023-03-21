
# Store test (rails)

Este test fue creado usando postgresql, Angular y Rails.

Para ejecutar este proyecto por favor siguan estos pasos:


## instalacion

### Backend
Primero instalaremos postgresql (https://www.postgresql.org/download/), usando el puerto por default (5432) y usaremos d1t1b1s2 como contraseña. despues de la instalacion recomiendo revisar que las dos apis para la prueba si esten funcionando (https://fakestoreapi.com/products - https://dummyjson.com/products/)

despues sera necesario tener una instalacion de ruby y de rails completamente funcional, en cuanto la tengamos abriremos la carpeta del proyecto en la terminal y los siguientes comandos en orden

```bash
  gem install bundler
  bundler install
  gem install rake
  rake db:create
  rails db:migrate
```
el siguiente comando fallara si alguna de las apis no esta activa

```bash
  rake product:populate
```
en caso de que alguna api este dando problemas por favor abrir el archivo store-test\app\services\populate_products_service.rb y quitar la referencia a la api defectuosa en la linea 3 ([*DummyClient.get_products, *FakeStoreClient.get_products]).

al acabar la instalacion solo debemos correr el servidor de rails

```bash
  rails s
```
### Frontend (Angular)

para esta instalacion debemos de tener instalado node js junto con NPM (https://nodejs.org/en/download), en cuanto lo tengamos abriremos otra terminal en la carpeta del proyecto e ingresaremos la siguiente secuencia de comandos:

```bash
  cd store_front
  npm install -g @angular/cli
  npm install
```
¡y listo! con solo ejecutar 
```bash
'ng serve'
```
en la misma terminal podremos acceder a http://localhost:4200 , donde veremos el proyecto correr totalmente funcional
