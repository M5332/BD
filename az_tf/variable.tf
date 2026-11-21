variable "location" {
  default = "eastus"
}

variable "cluster_name" {
  default = "aks-cluster"
}
variable "node_vm_size" {
  default = "Standard_D2nds_v6"

}

variable "acr_name" {
  description = "Globally unique Azure Container Registry name."
  type        = string
  default     = "weddinginvitationacr"

  validation {
    condition     = can(regex("^[A-Za-z0-9]{5,50}$", var.acr_name))
    error_message = "ACR names must be 5-50 alphanumeric characters."
  }
}

variable "github_actions_principal_id" {
  description = "Optional service principal object ID used by GitHub Actions to push images to ACR."
  type        = string
  default     = ""
}

variable "dns_zone_name" {
  description = "Optional DNS zone name, such as example.com. Leave empty to skip DNS resources."
  type        = string
  default     = ""
}

variable "dns_record_name" {
  description = "DNS record label for the invitation site, or @ for the zone apex."
  type        = string
  default     = "invitation"
}
