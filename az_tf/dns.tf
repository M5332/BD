resource "azurerm_public_ip" "ingress" {
  name                = "wedding-ingress-ip"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_role_assignment" "aks_ingress_ip_network_contributor" {
  scope                = azurerm_public_ip.ingress.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

resource "azurerm_dns_zone" "wedding" {
  count               = var.dns_zone_name == "" ? 0 : 1
  name                = var.dns_zone_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_dns_a_record" "wedding" {
  count               = var.dns_zone_name == "" ? 0 : 1
  name                = var.dns_record_name
  zone_name           = azurerm_dns_zone.wedding[0].name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = 300
  records             = [azurerm_public_ip.ingress.ip_address]
}