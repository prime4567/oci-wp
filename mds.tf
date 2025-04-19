data "oci_secrets_secretbundle" "mysql-admin-pass" {
  secret_id = var.mysql-admin-pass-secret-OCID
}

data "oci_secrets_secretbundle" "mysql-admin-user" {
  secret_id = var.mysql-admin-user-secret-OCID
}

resource "oci_mysql_mysql_db_system" "mds-wp" {
    display_name = var.mysql-db-name
    admin_password = base64decode(data.oci_secrets_secretbundle.mysql-admin-pass.secret_bundle_content.0.content)
    admin_username = base64decode(data.oci_secrets_secretbundle.mysql-admin-user.secret_bundle_content.0.content)
    availability_domain = "Uhiv:US-ASHBURN-AD-2"
    compartment_id = oci_identity_compartment.my_compartment.id
    shape_name = "MySQL.Free"
    subnet_id = oci_core_subnet.vcn-db-subnet.id
    
    ## this appear as optional in documentation
    ## but it is a must to add it

    data_storage_size_in_gb = 50
}