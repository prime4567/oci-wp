# compartment-vars.tf
#Required
variable "compute_name" {
  description = "Copute Display Name"
  type        = string
}
variable "ssh_authorized_keys" {
  description = "Path to SSH Public Key"
  type        = string
}