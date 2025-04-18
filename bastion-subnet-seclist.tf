# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "bastion-security-list"{

  # Required
  compartment_id = oci_identity_compartment.my_compartment.id
  vcn_id = module.vcn.vcn_id

  # Optional
  display_name = "security-list-for-bastion-subnet"

  # Egress rule to DB Subnet
  egress_security_rules {
      stateless = false
      destination = "10.0.1.0/24"
      destination_type = "CIDR_BLOCK"
      protocol = "6" 
      tcp_options { 
          min = 3306
          max = 3306
      }
  }

  # Egress rule to Application Subnet
  egress_security_rules {
      stateless = false
      destination = "10.0.2.0/24"
      destination_type = "CIDR_BLOCK"
      protocol = "6" 
      tcp_options { 
          min = 22
          max = 22
      }
  }
}