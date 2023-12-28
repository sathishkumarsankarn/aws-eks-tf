resource "kubernetes_service_v1" "nodeport_service" {
  metadata {
    name = "myapp-deployment-nodeport-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.app_deploy.spec.0.selector.0.match_labels.app
    }
    port {
        node_port = 31280
        port        = 80
        target_port = 80
        name = "http"
    }

    type = "NodePort"
  }
}