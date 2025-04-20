# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet

resource "oci_core_subnet" "vcn-app-subnet"{

  # Required
  compartment_id = oci_identity_compartment.my_compartment.id
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.2.0/24"
 
  # Optional
  # Caution: For the route table id, use module.vcn.nat_route_id.
  # Do not use module.vcn.nat_gateway_id, because it is the OCID for the gateway and not the route table.
  route_table_id = module.vcn.nat_route_id
  security_list_ids = [oci_core_security_list.app-security-list.id]
  display_name = "app-subnet"
}