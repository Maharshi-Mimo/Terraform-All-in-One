terraform {
    required_providers {
    oci = {
        source = "oracle/oci"
        }
    }
}

provider "oci" {
    region              = "region-of-your-choice" #select your default region. 
    auth                = "SecurityToken"
    config_file_profile = "path/to/profile/configured."
}


