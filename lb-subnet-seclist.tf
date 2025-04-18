# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "lb-security-list" {

  # Required
  compartment_id = oci_identity_compartment.my_compartment.id
  vcn_id = module.vcn.vcn_id

  # Optional
  display_name = "security-list-for-load-balancer-subnet"

  # Egress rule to application subnet
  egress_security_rules {
      stateless = false
      destination = "10.0.2.0/24"
      destination_type = "CIDR_BLOCK"
      protocol = "6" 
      tcp_options { 
          min = 80
          max = 80
      }
  }

  egress_security_rules {
      stateless = false
      destination = "10.0.2.0/24"
      destination_type = "CIDR_BLOCK"
      protocol = "6" 
      tcp_options { 
          min = 443
          max = 443
      }
  }

    ingress_security_rules { 
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6"
      tcp_options { 
          min = 80
          max = 80
      }
    }

    ingress_security_rules { 
        stateless = false
        source = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
        protocol = "6"
        tcp_options { 
            min = 443
            max = 443
        }
    }
}