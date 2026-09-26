terraform {
backend "azurerm" {
resource_group_name = var.resource_group_name
storage_account_name = "mystatetfstore"
container_name = "tfstate"
key = "aks.tfstate"
}
}