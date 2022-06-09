variable "appName" {
  default = "UrbanTestApp"
}

variable "appNamespace" {
  default = "prod"
}

variable "appImage" {
  default = "saridor/urban-test:v1"
}

variable "appResource" {
  type = map(string)
  default = {
    "cpu"    = "500m"
    "memory" = "128Mi"
  }
}

variable "appReplicas" {
  type    = number
  default = 3
}