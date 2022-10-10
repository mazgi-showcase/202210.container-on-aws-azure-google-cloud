variable "project_unique_id" {}

# <Google>
variable "gcp_default_region" {}
# variable "gcp_project_id" {}
# </Google>

variable "firewall_tags" {
  default = {
    firewall-ingress-allow-from-allowed-list = "firewall-ingress-allow-from-allowed-list"
  }
}
