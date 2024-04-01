# Install Terraform 

## Windows 
- Install Terraform for Windows [Page](https://developer.hashicorp.com/terraform/install#windows)

- Extract the file and store it. For example: `C:\Terraform` 

- Add the Path to System Environment Variable.  

##  Linux (Ubuntu) 
- Install Terraform for Linux [Page](https://developer.hashicorp.com/terraform/install#linux)

or

```bash 
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
## macOS

- Install Terraform for macOS [Page](https://developer.hashicorp.com/terraform/install#darwin) 

or 

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
``` 