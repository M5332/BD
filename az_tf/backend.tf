terraform {
backend "azurerm" {
resource_group_name = "lab_storage"
storage_account_name = "mytf"
container_name = "tfstate"
key = "aks.tfstate"
}
}