output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "acr_login_server" {
  value = azurerm_container_registry.wedding.login_server
}

output "ingress_public_ip" {
  value = azurerm_public_ip.ingress.ip_address
}

output "wedding_hostname" {
  value = var.dns_zone_name == "" ? "" : (var.dns_record_name == "@" ? var.dns_zone_name : "${var.dns_record_name}.${var.dns_zone_name}")
}
