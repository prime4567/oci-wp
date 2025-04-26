resource "oci_core_instance" "app_instance_2" {
    # Required
    availability_domain = "Uhiv:US-ASHBURN-AD-2"
    compartment_id = oci_identity_compartment.my_compartment.id
    shape = "VM.Standard.E2.1.Micro"

    source_details {
        source_id = "ocid1.image.oc1.iad.aaaaaaaarmp53tuhdoepsh4breobvmbdbq7gbmhosdogknb34xidkfi6hxjq"
        source_type = "image"
        boot_volume_size_in_gbs = 50
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

    agent_config {
        is_management_disabled = false
        is_monitoring_disabled = false
        
        plugins_config {
            desired_state = "ENABLED"
            name = "Bastion"
        }
        plugins_config {
            desired_state = "ENABLED"
            name          = "Management Agent"
        }

        plugins_config {
            name          = "OS Management Service Agent"
            desired_state = "ENABLED"
        }

        plugins_config {
            name          = "Compute Instance Monitoring"
            desired_state = "ENABLED"
        }
    }
}