terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  # Configuration options
}


# pull image from docker provider
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}


# build docker-container
resource "docker_container" "nginx_contianer" {
  name  = "terraform_nginx_container"
  image = docker_image.nginx_image.image_id

  ports {
    internal =  80
    external = 5002
  }
}


