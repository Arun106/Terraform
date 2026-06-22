erraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"
    }
  }
required_version = "1.15.6"

  cloud {

    organization = "B13"

    workspaces {
      name = "rg_ws"
    }
  }
}

provider "azurerm" {
  features {}
}
