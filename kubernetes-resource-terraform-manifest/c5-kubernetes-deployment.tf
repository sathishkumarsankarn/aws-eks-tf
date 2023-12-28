resource "kubernetes_deployment_v1" "app_deploy" {
  metadata {
    name = "myapp-deployment"
    labels = {
      app = "myapp-frontend"
    }
  }

  spec {
    replicas = 2
    strategy {
      type = "RollingUpdate"  #default
    }
    paused = true #pausing deployment 
    revision_history_limit = 5

    selector {
      match_labels = {
        app = "myapp-frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp-frontend"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"    #stacksimplify/kubenginx:1.0.0
          name  = "myapp-frontend-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}