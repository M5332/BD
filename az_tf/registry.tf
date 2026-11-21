resource "azurerm_container_registry" "wedding" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.wedding.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

resource "azurerm_role_assignment" "github_acr_push" {
  count                = var.github_actions_principal_id == "" ? 0 : 1
  scope                = azurerm_container_registry.wedding.id
  role_definition_name = "AcrPush"
  principal_id         = var.github_actions_principal_id
}