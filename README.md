# Project Overview

This Terraform script deploys a set of Azure resources for a web application infrastructure. The deployment follows this sequence:

1. **Resource Group**: Creates an Azure Resource Group to organize the resources.

2. **Azure Kubernetes Service (AKS) Cluster**: Deploys an AKS cluster, a managed Kubernetes service for container orchestration.

3. **Node Pools**: Configures multiple node pools within the AKS cluster, each tailored for specific workloads or resource requirements.

4. **Namespaces**: Sets up Kubernetes namespaces for better resource isolation and management.

5. **PostgreSQL Database**: Deploys a PostgreSQL database within the "db" namespace, which can be used as a backend database for your application.

6. **WordPress Application**: Installs WordPress within the "web" namespace, allowing you to host your web application.

## Flow

![alt text](https://github.com/Meet-S0ni/Terraform-AKS/blob/main/flow.png)

## Prerequisites

Before you begin, ensure you have:

- Azure Account with Aks cluster
- [connect aks cluster](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli#connect-to-the-cluster). and get your kubeconfig  
- [Terraform](https://www.terraform.io/downloads.html) installed.
- Azure CLI installed and authenticated.
- Proper permissions to create Azure resources.

## Deployment

Follow these steps to deploy the infrastructure:

1. Clone this repository:

   ```bash
   git clone https://github.com/Meet-S0ni/Terraform-AKS.git
   cd Terraform-AKS

2. Get Kubeconfig file from /home/<youruser>/.kube/config

3. Create Resources

   ```bash
   terraform init
   terraform plan 
   terraform apply
