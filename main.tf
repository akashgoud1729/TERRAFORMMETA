

resource "azurerm_resource_group" "DEV-RG" {
  name     = "DEV-RG"
  location = "westus2"
  tags = {
    environment = "testing"
  }
}


resource "azurerm_storage_account" "storage_account01" {
  for_each                  = toset(["westeurope","southindia","westus"])
  #count                    =  5
  name                     = "telefonica${each.value}"
  resource_group_name      = azurerm_resource_group.DEV-RG.name
  location                 = each.value
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_account" "storage_account02" {
 for_each = { 
    "hdfcloan" = "rs-tcs-01"
    "sbiloan"  = "rs-tech-01"
    "rbiloan" = "rs-vm-02"
  }
  name                     = each.key
  resource_group_name      = each.value
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}