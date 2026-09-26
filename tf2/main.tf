resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_linux_virtual_machine" "vm" {
  name = "linux-vm"
  resource_group_name = variable.resource_group_name
  location = variable.location
  size = variable.node_vm_size
}
