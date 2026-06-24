terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.78.0"
    }
  }

  cloud {
    organization = "Arun_Org"

    workspaces {
      name = "Arun-Azure-TF-Demo"
    }
  }
}

provider "azurerm" {
  features {}

}
