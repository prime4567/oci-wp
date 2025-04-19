# mds-vars.tf
#Required
variable "mysql-admin-user-secret-OCID" {
  description = "OCID of MySQL Admin user in OCI Vault"
  type        = string
}
variable "mysql-admin-pass-secret-OCID" {
  description = "OCID of MySQL Admin password in OCI Vault"
  type        = string
}
variable "mysql-db-name" {
  description = "Name of Database"
  type        = string
}
