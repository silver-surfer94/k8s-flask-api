project = "k8s-flask-api"

app "k8s-flask-api" {
  labels = {
    "service" = "k8s-flask-api",
    "env"     = "dev"
  }

  build {
    use "docker-pull" {
      image = "adetesan94/liatrio-k8s-api"
      tag   = "v1.0.0"
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
