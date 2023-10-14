**Docker overview**

Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code, you can significantly reduce the delay between writing code and running it in production.

**Dockerfile**

A Dockerfile is a text file used to define the configuration and steps required to create a Docker image. Docker images are the building blocks of Docker containers, which are isolated and lightweight environments

**Docker Image**

A Docker image is a file used to execute code in a Docker container. Docker images act as a set of instructions to build a Docker container, like a template. Docker images also act as the starting point when using Docker. An image is comparable to a snapshot in virtual machine (VM) environments.

**Docker Container**

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

**Docker Components**

Docker Client:
    The Docker Client is the command-line tool or API that allows users to interact with the Docker daemon. Users can issue commands to the Docker Client to create, manage, and monitor Docker containers and other resources.

b. Docker Image:
    A Docker Image is a lightweight, standalone, and executable package that contains all the necessary code, libraries, and dependencies to run an application. Images are used as the building blocks for creating Docker containers.

c. Docker Daemon:
    The Docker Daemon (or Dockerd) is the background service that manages Docker containers on a system. It listens for Docker API requests and is responsible for building, running, and managing containers.

d. Docker Networking:
    Docker Networking is a feature that enables communication between Docker containers, as well as between containers and the outside world. Docker provides various networking modes, including bridge networks, overlay networks, and host networks, to facilitate connectivity between containers.

e. Docker Registry:
    A Docker Registry is a service or a repository where Docker images can be stored and shared. The Docker Hub is a popular public registry, but you can also set up private registries to store and distribute custom Docker images.

f. Docker Container:
    A Docker Container is a runnable instance of a Docker image. Containers are isolated environments that package an application and its dependencies, allowing for consistent and portable execution across different environments. Containers are lightweight and can be easily created, started, stopped, and removed.

**Docker advanced Components**

a. Docker Compose:
    Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to define the services, networks, and volumes for an application in a single Compose file (usually a YAML file). With Docker Compose, you can start and manage complex applications with multiple containers using a single command. This simplifies the process of deploying and managing interconnected services within a Docker application.

b. Docker Swarm:
    Docker Swarm is a native clustering and orchestration solution provided by Docker. It allows you to create and manage a cluster of Docker nodes, where each node can run Docker containers. Swarm provides features for load balancing, service discovery, and high availability. You can deploy and scale services across multiple nodes in a Swarm, making it a useful tool for managing and scaling containerized applications in a distributed environment. Docker Swarm competes with other container orchestration platforms like Kubernetes and is a good choice for simpler use cases or when you want to work within the Docker ecosystem.

**Docker volumes**

Docker volumes are a mechanism for persisting and managing data in Docker containers. They provide a way to store and share data between containers or between the host system and containers. Docker volumes are particularly useful for ensuring that data survives the lifecycle of containers, even when containers are stopped, removed, or replaced.

**Dockerfile instructions**

1.FROM : This instruction specifies the base image from which you want to build your image. It's the     starting point for your Docker image.
Example:
FROM ubuntu:20.04

2.LABEL : Adds metadata to the image.
Example:
LABEL version="1.0"
LABEL maintainer="your@email.com"

3.ENV : Sets environment variables in the container.
Example:
ENV DB_HOST=localhost DB_PORT=5432
ENV DATABASE_URL="postgres://user:password@dbhost/dbname"

4.RUN : instruction allows you to execute commands within the container during the image build process. These commands are typically used to install software packages, update packages, and set up configurations.
Example:
RUN apt-get update && apt-get install -y curl

5.COPY : The COPY instruction copies files or directories from the host machine to the container's filesystem. 
Example:
COPY app.py /app/

6.ADD : Specifies the source file, directory, or URL that you want to copy into the image.
Example:
ADD app.py /app/
ADD https://example.com/myfile.txt /app/
ADD my_archive.tar.gz /app/

7.WORKDIR : Sets the working directory for subsequent commands in the Dockerfile.
Example:
WORKDIR /app

8.CMD : Sets default parameters that can be overridden from the Docker Command Line Interface (CLI) when a container is running.
Example:
CMD ["python", "app.py"]

9.ENTRYPOINT : Default parameters that cannot be overridden when Docker Containers run with CLI parameters.
Example:
ENTRYPOINT ["python", "app.py"]

10.RUNTIME : The RUNTIME instruction sets metadata about the image's behavior at runtime. For example, USER sets the user context for the image, and VOLUME designates a directory as a volume.
Example:
USER nonrootuser
VOLUME /data

11.EXPOSE : Informs Docker that the container listens on specific network ports at runtime
Example:
EXPOSE 80

**Docker Commands**

1.docker version : Displays Docker version information, including the client and server versions.

2.docker info : Provides detailed information about the Docker installation, such as the number of containers, images, storage drivers, and more.

3.docker pull <image> : Downloads a Docker image from a registry (like Docker Hub) to your local machine. The image is used as a base for creating containers.

4.docker images : Lists all Docker images available on your local machine, along with their sizes and tags.

5.docker build -t <tag> <path> : Builds a Docker image from a Dockerfile located in the specified path and assigns it a given tag.

6.docker run <image> : Creates and starts a new container from the specified image. If the image is not available locally, Docker will try to pull it first.

7.docker inspect : command is used to obtain detailed information about Docker objects, such as containers, images, volumes, networks, and more. It provides a JSON-formatted output that includes a wide range of information about the specified Docker object

8.docker ps : Lists all running containers along with their details, including container IDs, names, status, and ports.

9.docker ps -a : Lists all containers, including those that are not currently running.

10.docker exec -it <container> <command> : Runs a command inside a running container. The -it flag allows interaction with the command's input and output streams.

11.docker stop <container> : Stops a running container gracefully, giving it a chance to perform any necessary cleanup before shutting down.

12.docker start <container> : Starts a stopped container that was previously created but is not currently running.

13.docker restart <container> : Stops and then starts a container, effectively restarting it.

14.docker logs <container> : Displays the logs generated by a container, helping you troubleshoot issues or monitor application output.

15.docker rm <container> : Removes a stopped container. The -f flag can be used to force removal of a running container.

16.docker rmi <image> : Removes a Docker image from your local machine. The -f flag can be used to force removal of an image.

17.docker stop $(docker ps -q) : commonly used one-liner in Docker to stop all running containers on your Docker host.

18.docker container prune -f : command is used to forcefully remove all stopped containers in Docker without requiring confirmation from the user.

19.docker ps -a -f status=exited : command is used to list all containers, including both running and stopped containers, that have an "exited" status. An "exited" container is one that was running but has since stopped, either because the process it was running completed or because it encountered an error and terminated.

20.docker rm $(docker ps -a -f status=exited -q) : command is a commonly used one-liner in Docker to remove all stopped containers that have an "exited" status.

21.docker images -f dangling=true : command is used to list Docker images that are in a "dangling" state. Dangling images are images that are not associated with any containers and are not tagged with a specific version or name.

22.docker rmi $(docker images -a -q) : commonly used one-liner in Docker to remove all Docker images on your system, including both stopped and dangling images.

**Docker-Composefile**

A Docker Compose file is a YAML file used to define and configure multi-container Docker applications. It allows you to define the services, networks, and volumes required for your application in a single file. Docker Compose simplifies the process of managing complex applications composed of multiple containers by providing an easy-to-read and maintainable configuration

**Docker-Compose Commands instructions**

docker-compose up : This command starts your application and all the services defined in your docker-compose.yml file. It creates and attaches to the necessary containers, networks, and volumes.

docker-compose down : This command stops and removes the containers, networks, and volumes defined in your docker-compose.yml file. It effectively shuts down your application.

docker-compose build : This command builds the Docker images defined in your docker-compose.yml file. It's useful when you've made changes to your Dockerfiles or other build-related files.

docker-compose ps : This command shows the status of the containers defined in your docker-compose.yml file. It displays information about each service, including container names, status, and ports.

docker-compose logs : This command displays the logs generated by the containers in your application. You can specify a service name to view logs for a specific service.

docker-compose exec : This command lets you execute a command in a running container. You specify the service name and the command you want to run.

docker-compose run : Similar to docker-compose exec, this command lets you run a one-off command in a new container instance. It's often used for running tests or ad-hoc commands.

**Docker-Compose file instructions**

version: Specifies the version of the Compose file format being used.

services : Defines the individual services (containers) that make up your application.
    image : Specifies the Docker image to use for the service.
    build : Specifies the build context and Dockerfile for building a custom image.
    command : Overrides the default command specified in the Docker image.
    environment : Sets environment variables for the service.
    volumes : Defines volume mounts for the service.
    ports : Specifies ports to be exposed by the service.
    networks : Associates the service with specific networks.

networks: Defines networks that containers will connect to.

volumes: Defines volumes that containers can use to store data.

configs (Docker Swarm only): Defines configuration files to be used by services.

secrets (Docker Swarm only): Defines secrets to be used by services.

secrets (Docker Swarm only): Defines secrets to be used by services.

deploy (Docker Swarm only): Specifies deployment-related settings for services.

version: Specifies the version of the Compose file format being used.

**Docker-Compose file Example**

version: '3'
services:
  web:
    image: nginx:latest
    ports:
      - "80:80"
  app:
    build:
      context: ./app
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
    environment:
      - DEBUG=true
    volumes:
      - ./app/src:/app/src
networks:
  mynetwork:
    driver: bridge
