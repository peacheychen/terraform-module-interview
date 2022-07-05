terraform {
  required_version = ">= 0.1.0.7"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

resource "docker_container" "container" {
  image = var.docker_container_image
  name  = var.docker_container_name

  env = var.docker_container_env

  networks_advanced {
    name = var.docker_container_network
  }

  lifecycle {
    ignore_changes = all
  }
}