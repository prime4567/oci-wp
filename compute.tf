resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = "Uhiv:US-ASHBURN-AD-2"
    compartment_id = oci_identity_compartment.my_compartment.id
    shape = "VM.Standard.E2.1.Micro"

    source_details {
        source_id = "ocid1.image.oc1.iad.aaaaaaaamemupy4qkc7dzgz2m3gecilnxtoinbx7lwc56gezaq3gvyamnosa"
        source_type = "image"
    }

    # Optional
    display_name = var.compute_name
    create_vnic_details {
        assign_public_ip = false
        subnet_id = oci_core_subnet.vcn-app-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file(var.ssh_authorized_keys)
    } 
    preserve_boot_volume = false
}