# project-django-01

Guía de creación y despliegue de una aplicación Django
1. Inicialización de Git
Inicializamos Git en el proyecto.

Verificamos que el repositorio haya quedado correctamente creado.

Bash: git init

2. Creación de la aplicación DjangoCrear entorno virtualCreamos y activamos un 
entorno virtual para trabajar de forma aislada:

Bash: source myenv/bin/activateCrear proyecto Django

Creamos el proyecto Django.

Configuramos la aplicación.

Creamos la primera vista.

Verificamos que la aplicación funcione correctamente.
Punto de inicio del Pipeline:
A partir de aquí comenzaremos a trabajar en la implementación del pipeline CI/CD.

3. GitHub y GitLabGitHub
Agregamos GitHub al proyecto.

La aplicación ya fue subida a GitHub.

Pendiente: continuar con la configuración relacionada con GitHub.
GitLab
GitLab todavía no ha sido iniciado.

4. Creación del DockerfileCreamos el primer Dockerfile para contenerizar la aplicación Django.Después:
Construimos la imagen Docker.

Verificamos que la imagen se haya creado correctamente.

Ejecutamos el contenedor.

Comprobamos que la aplicación Django funcione correctamente.
Por ejemplo:

docker run p 8000:8000 my-django-app:latest python manage.py runserver 0.0.0.0:8000

También podemos ejecutar:
docker run p 8000:8000  my-django-app:latest
La aplicación debería quedar disponible en:http://localhost:8000

4. Subimos la imagen de docker al registry, lo haremos mediante github Actions.
primero debes tener activar nuestro runner, luego iniciamos la configuracion de nuestra action.

4.1 Creacion de Runner
Add new self-hosted runner · Naikolan/project-django-01
Using self-hosted runners in public repositories is not recommended. Forks of your public repository can potentially run dangerous code on your self-hosted runner by creating a pull request. Learn more about security hardening for self-hosted runners.

Adding a self-hosted runner requires that you download, configure, and execute the GitHub Actions Runner. If you do not already have an existing volume licensing agreement for your GitHub purchases, by downloading and configuring the GitHub Actions Runner, you agree to the GitHub Customer Agreement.

# Create a folder
$ mkdir actions-runner && cd actions-runner# Download the latest runner package
$ curl -o actions-runner-linux-x64-2.336.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.336.0/actions-runner-linux-x64-2.336.0.tar.gz# 

Optional: Validate the hash

$ echo "04cf0be1aff4c3ec3554466c39124ca250e3effd8873bb7e8d68535aa9505d5d  actions-runner-linux-x64-2.336.0.tar.gz" | shasum -a 256 -c

# Extract the installer
$ tar xzf ./actions-runner-linux-x64-2.336.0.tar.gz

Configure
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/Naikolan/project-django-01 --token BOEWKIC6SZ3DYKZ4AL7CQHLKQDR2Q

# Last step, run it!
$ ./run.sh

Using your self-hosted runner
# Use this YAML in your workflow file for each job
runs-on: self-hosted

4.2 Creamos nuestra Action
Partimos creando el archivo workflow en el repositorio
