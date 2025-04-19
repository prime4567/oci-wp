# outputs.tf

output "compartment-OCID" {
  value = oci_identity_compartment.my_compartment.id
}

output "compartment" {
  value = oci_identity_compartment.my_compartment.name
}

# Outputs for the vcn module

output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = module.vcn.vcn_id
}
output "id-for-route-table-that-includes-the-internet-gateway" {
  description = "OCID of the internet-route table. This route table has an internet gateway to be used for public subnets"
  value = module.vcn.ig_route_id
}
output "nat-gateway-id" {
  description = "OCID for NAT gateway"
  value = module.vcn.nat_gateway_id
}
output "id-for-for-route-table-that-includes-the-nat-gateway" {
  description = "OCID of the nat-route table - This route table has a nat gateway to be used for db subnets. This route table also has a service gateway."
  value = module.vcn.nat_route_id
}

# Outputs for db security list

output "db-security-list-name" {
  value = oci_core_security_list.db-security-list.display_name
}
output "db-security-list-OCID" {
  value = oci_core_security_list.db-security-list.id
}

# Outputs for db subnet

output "db-subnet-name" {
  value = oci_core_subnet.vcn-db-subnet.display_name
}
output "db-subnet-OCID" {
  value = oci_core_subnet.vcn-db-subnet.id
}

output "db-subnet-cidr" {
  value = oci_core_subnet.vcn-db-subnet.cidr_block
}

# Outputs for load balancer security list

output "lb-security-list-name" {
  value = oci_core_security_list.lb-security-list.display_name
}
output "lb-security-list-OCID" {
  value = oci_core_security_list.lb-security-list.id
}

# Outputs for load balancer subnet

output "lb-subnet-name" {
  value = oci_core_subnet.vcn-lb-subnet.display_name
}
output "lb-subnet-OCID" {
  value = oci_core_subnet.vcn-lb-subnet.id
}