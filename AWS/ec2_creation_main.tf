provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-03bb6d83c60fc5f7c" #this is Ubuntu image for ap-south-1 location. 
    instance_type = "t2.micro"
    key_name = "K8s-project" #give your own key name here
    tags = {
        Name = "ec2-instance"
    
}
}

resource "aws_ec2_instance_state" "ec2_state" {
    instance_id = aws_instance.ec2.id
    state = "running" #change the state to "stop" "running"
}

# The following arguments are required:

# instance_id - (Required) ID of the instance.
# state - (Required) - State of the instance. Valid values are stopped, running.