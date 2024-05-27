vpc_id              = "vpc-XXXXXXXXX"
Instance_type       = "t2.medium"
minsize             = 1
maxsize             = 2
public_subnets     = ["subnet-XXXXXXXXXX", "subnet-XXXXXXXXX"] # Service Subnet
elb_public_subnets = ["subnet-XXXXXXXXXX", "subnet-XXXXXXXXX"] # ELB Subnet
tier = "WebServer"
solution_stack_name= "64bit Amazon Linux 2 v3.2.0 running Python 3.8"