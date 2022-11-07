terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "notebook-jupyter" {
  name         = "monteblack1/notebook-jupyter:latest"
  keep_locally = false
}

resource "docker_container" "notebook-jupyter" {
  image = docker_image.notebook-jupyter.latest
  name  = "tutoriall"
  ports {
    internal = 8888
    external = 8886
  }
}

resource "docker_image" "api" {
  name         = "monteblack1/api:latest"
  keep_locally = false
}

resource "docker_container" "api" {
  image = docker_image.api.latest
  name  = "tutorial1"
  ports {
    internal = 5000
    external = 5000
  }
}