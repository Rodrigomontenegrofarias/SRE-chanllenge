terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "notebook-prueba" {
  name         = "monteblack1/notebook-prueba:latest"
  keep_locally = false
}

resource "docker_container" "notebook-prueba" {
  image = docker_image.notebook-prueba.latest
  name  = "tutorial"
  ports {
    internal = 8888
    external = 8886
  }
}