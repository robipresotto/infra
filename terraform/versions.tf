terraform {
  required_version = ">= 1.0.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}