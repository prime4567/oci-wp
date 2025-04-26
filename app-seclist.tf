# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "app-security-list"{

# Required
  compartment_id = oci_identity_compartment.my_compartment.id
  vcn_id = module.vcn.vcn_id

# Optional
  display_name = "security-list-for-db-subnet"

  # Egress rule to database subnet
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

  # Egress rule to bastion subnet
  egress_security_rules {
    stateless = false
    destination = "10.0.255.240/29"
    destination_type = "CIDR_BLOCK"
    protocol = "all" 
  }

  # Egress rule to OCI CLoud Management Agent Service
  egress_security_rules {
    stateless = false
    destination = "all-iad-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
    protocol = "6" 
  }

  # Ingress rule from database subnet
  ingress_security_rules { 
    stateless = true
    source = "10.0.1.0/24"
    source_type = "CIDR_BLOCK"
    # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
    protocol = "all"
  }

  # Ingress rule from bastion subnet
  ingress_security_rules { 
    stateless = true
    source = "10.0.255.240/29"
    source_type = "CIDR_BLOCK"
    # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
    protocol = "6"
    tcp_options { 
      min = 22
      max = 22
      }
  }
}