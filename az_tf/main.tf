data "azurerm_resource_group" "rg" {
  name     = "lab"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "aksdemo"

  default_node_pool {
    name            = "systempool"
    node_count      = 1
    vm_size         = var.node_vm_size
    vnet_subnet_id  = azurerm_subnet.private.id
  }

  identity {
    type = "SystemAssigned"
  }
  node_provisioning_profile {
    mode = "Auto"
  }
  network_profile {
   network_plugin = "azure"
   service_cidr = "10.100.0.0/16"
   dns_service_ip = "10.100.0.10"
}
}

resource "azurerm_kubernetes_cluster_node_pool" "publicpool" {
  name                  = "publicpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.node_vm_size
  node_count            = 1
  vnet_subnet_id        = azurerm_subnet.public.id
}
