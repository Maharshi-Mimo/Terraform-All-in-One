terraform {
    backend "s3" { #make sure to have "versioning" enabled.
    bucket = "my_s3_bucket_name" #choose the bucket name
    key = "path/to/store/tfstate_file" # Other workspaces are stored using the path <workspace_key_prefix>/<workspace_name>/<key>
    region = "ap-south-1"
    dynamodb_table = "Tabele_name" #make sure the table have LockID of string type. 
    } 
}