# DockerAngular

## Repository

https://github.com/CartagoGit/DockerAngular

## DockerHub link

https://hub.docker.com/repository/docker/cartagodocker/angular

## Description

Image for charging in other docker images to get zsh as shell default for root or for other existing or new users in the containers.

> This dockerfile use Ubuntu 24.04
> This image has curl, wget, ssh and git installed.
> This image inherit from [`cartagodocker/zsh`](https://hub.docker.com/repository/docker/cartagodocker/zsh/general) and [`cartagodocker/nodebun`](https://hub.docker.com/repository/docker/cartagodocker/nodebun/general) images.

---

# Usage

## Create Image

```bash
docker build -t angular-image -f ./Dockerfile ./
```

## Create debug-container

```bash
docker run --rm -it --name angular-container angular-image
```

## Create debug-container for user 1000:1000

```bash
docker run --rm -it --name angular-container --user 1000:1000 angular-image
```

## Upload docker image to dockerhub

With github actions in repository it will be update automaticatlly in DockerHub with the tag of branches.

## To use in other docker images

Just add the next line in the Dockerfile to base the other image on this one.

```Dockerfile
FROM cartagodocker/angular:latest
```

---

# For specific inner scripts:

Look the cartagodocker/zsh image documentation in the next link:

[`cartagodocker/zsh`](https://hub.docker.com/repository/docker/cartagodocker/zsh/general)

Look the cartagodocker/nodebun image documentation in the next link:

[`cartagodocker/nodebun`](https://hub.docker.com/repository/docker/cartagodocker/nodebun/general)