

#STRINGVARS
vpc_name = "ad-enabled-terraform"
azs = ["us-east-2a", "us-east-2b", "us-east-2c"]
public_subnet_tags = "terraform-public"
private_subnet_tags = "terraform-private"


#CIDR
private_subnets_cidr = ["10.32.16.0/20", "10.32.32.0/20", "10.32.64.0/20"]
public_subnets_cidr = ["10.32.128.0/20", "10.32.144.0/20", "10.32.160.0/20"]
cidrblock = "10.32.0.0/16"

