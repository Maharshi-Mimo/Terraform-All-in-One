# AWS Provider

AWS provider to interact with many resources supported by AWS. 

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

```
## Authentication and Configuration

Configuration for the AWS Provider can be derived from several sources, which are applied in the following order:

Parameters in the provider configuration
Environment variables
Shared credentials files
Shared configuration files
Container credentials
Instance profile credentials and Region

## Provider Configuration

```hcl 
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```
**Warning**
Hard-coded credentials are not recommended in any Terraform configuration and risks secret leakage should this file ever be committed to a public version control system.

## Shared Configuration and Credentials File
The AWS provider will look for a shared credentials file at the default location of `~/.aws/credentials` and a shared configuration file at `~/.aws/config` on linux and macOS, and and `%USERPROFILE%\.aws\config` and `%USERPROFILE%\.aws\credentials` on Windows. 

## Assuming an IAM Role

If provided with a role ARN, the AWS Provider will attempt to assume this role using the supplied credentials.

```hcl
provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/ROLE_NAME"
    session_name = "SESSION_NAME"
    external_id = "EXTERNAL_ID" 
  }
}
```