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