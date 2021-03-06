project = "k8s-flask-api"

app "k8s-flask-api" {
  labels = {
    "service" = "k8s-flask-api",
    "env"     = "dev"
  }

  build {
    use "docker" {
      platform = "linux/amd64"
      buildkit    = true
      disable_entrypoint = false
    }
    registry {
      use "docker" {
        image = "us-central1-docker.pkg.dev/liatrio-kubernetes-api/flask-api-k8s/flask-api-k8s"
        tag   = "latest"
      }
    }
  }

  deploy {
    use "kubernetes" {
      probe_path = "/"
      service_port = 8080
    }
  }

  release {
    use "kubernetes" {
      load_balancer = true
      port          = 80
    }
  }
}
