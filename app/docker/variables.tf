variable "docker_container_image" {
  description = "docker container image name"
  type        = string
  default     = ""
}

variable "docker_container_env" {
  description = "docker container environmental variables"
}

variable "docker_container_network" {
  description = "docker container network name"
  type        = string
  default     = ""
}

variable "docker_container_name" {
  description = "docker container name"
  type        = string
  default     = ""
}