terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.31.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "527ae9c4-5369-4c18-8807-d8d322155ae1"
    features {}
  # Configuration options
}