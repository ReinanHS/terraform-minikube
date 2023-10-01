resource "kubernetes_namespace" "apps_namespace" {
  metadata {
    annotations = {
      name = "apps-namespace"
    }

    name = "apps"
  }
}

resource "kubernetes_deployment" "nginx_deployment" {
  metadata {
    name = "nginx-terraform-example"
    labels = {
      version = "v1.0.0"
    }
    namespace = kubernetes_namespace.apps_namespace.id
  }

  spec {
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    strategy {
      type = "Recreate"
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name = "nginx"
          port {
            container_port = 80
            name = "web"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx_service" {
  metadata {
    name = "nginx"
    namespace = kubernetes_namespace.apps_namespace.id
  }
  spec {
    type = "NodePort"
    port {
      port = 80
      target_port = 80
      node_port = 30001
    }
    selector = {
      app = "nginx"
    }
  }
}

resource "kubernetes_ingress_v1" "nginx_ingress" {
  metadata {
    name = "nginx-ingress"
    namespace = kubernetes_namespace.apps_namespace.id
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/$1"
    }
  }
  spec {
    default_backend {
      service {
        name = "nginx"
        port {
          number = 80
        }
      }
    }

    rule {
      host = "nginx-hello-world.info"
      http {
        path {
          backend {
            service {
              name = "nginx"
              port {
                number = 80
              }
            }
          }
          path = "/"
          path_type = "Prefix"
        }
      }
    }
  }
}