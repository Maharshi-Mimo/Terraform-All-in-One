# Workspace

Each workspace configuration has an associated backend that defines how Terraform executes operations and where terraform stores persistent data, like [state](/Terraform/Terraform_State_File.md)

> [!IMPORTANT]
> Workspaces are not appropriate for system decomposition or deployments requiring separate credentials and acess controls.

## Workspace Interpolation

Terraform configuration may include the name of the current workspace using the `${terraform.workspace}` interpolation sequence. 

```hcl 
resource "aws_instance" "example" {
    tags {
        Name = "Web- ${terraform.workspace}"
    }
}
```