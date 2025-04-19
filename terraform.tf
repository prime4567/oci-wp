# terraform.tf
terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.0.0"
    }
  }

  backend "s3" {
    bucket                    = "terraform-states"
    region                    = "us-ashburn-1"
    key                       = "oci-wp"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    use_path_style              = true
    skip_s3_checksum            = true
    skip_metadata_api_check = true
    endpoints = {
      s3 = "https://idewgqrvfdqx.compat.objectstorage.us-ashburn-1.oraclecloud.com"
    }
  }


}
