resource "oci_bastion_bastion" "wp-bastion" {

  bastion_type     = "STANDARD"
  compartment_id   = oci_identity_compartment.my_compartment.id
  target_subnet_id = oci_core_subnet.vcn-bastion-subnet.id

  client_cidr_block_allow_list =  [ "103.47.133.0/24", "194.59.6.0/24" ]

  name = "Bastion-Access-Node"
}
