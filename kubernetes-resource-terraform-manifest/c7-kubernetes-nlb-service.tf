resource "kubernetes_service_v1" "nlb_service" {
  metadata {
    name = "myapp-deployment-nlb-service"
    annotations = {
        "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.app_deploy.spec.0.selector.0.match_labels.app
    }
    port {
      name = "http"
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}