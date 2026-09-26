terraform {
backend "azurerm" {
resource_group_name = "lab"
storage_account_name = "mystatetfstore"
container_name = "tfstate"
key = "aks.tfstate"
}
}