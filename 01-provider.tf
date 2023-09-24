# Use a recent version of Terraform
terraform {
  required_version = "1.5.4"
  required_providers {
    #-------------------------------------
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.67.0"
    }
    #-------------------------------------
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21.0"
    }
    #-------------------------------------
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.0"
    }
    #-------------------------------------
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.40.0"
    }
    #-------------------------------------	
    random = {
      source  = "hashicorp/random"
      version = "3.5.0"
    }
    #-------------------------------------
    null = {
      source  = "hashicorp/null"
      version = "3.2.0"
    }
    #-------------------------------------
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.7.0"
    }
    #-------------------------------------
    template = {
      source  = "gxben/template"
      version = "= 2.2.0-m1"
    }
    #-------------------------------------
  }
}
#-------------------------------------
# Terraform Provider Block for AzureRM
provider "azurerm" {
  features {
  }
}
#-------------------------------------
provider "kubernetes" {
  config_path = "./kube.config"
}
#-------------------------------------
provider "helm" {
  kubernetes {
    config_path = "./kube.config"
  }
}

#-------------------------------------
provider "null" {
}
#-------------------------------------
resource "random_pet" "aksrandom" {}
#-------------------------------------
