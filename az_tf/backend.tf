terraform {
backend "azurerm" {
resource_group_name = azurerm_resource_group.rg.name
storage_account_name = "mystatetfstore"
container_name = "tfstate"
key = "aks.tfstate"
}
}