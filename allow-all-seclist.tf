# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "allow-all-security-list"{

# Required
  compartment_id = oci_identity_compartment.my_compartment.id
  vcn_id = module.vcn.vcn_id

# Optional
  display_name = "security-list-for-db-subnet"

  # Egress rule to all
  egress_security_rules {
    stateless = false
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol = "all"
  }

  # Ingress rule from database subnet
  ingress_security_rules { 
    stateless = false
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
    protocol = "all"
  }
}