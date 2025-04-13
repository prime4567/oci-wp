locals {
  name_prefix = "tf"
}

resource "oci_identity_compartment" "my_compartment" {
  #Required
  compartment_id = var.compartment_id
  description    = var.description
  name           = format("%s-%s", local.name_prefix, var.name)
  #Optional
  # defined_tags  = var.defined_tags
  enable_delete = true
  # freeform_tags = var.freeform_tags
}
