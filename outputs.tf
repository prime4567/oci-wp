# outputs.tf

output "compartment-OCID" {
  value = oci_identity_compartment.my_compartment.id
}

output "compartment" {
  value = oci_identity_compartment.my_compartment.name
}
