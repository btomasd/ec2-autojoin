


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidrblock

  azs             = var.azs
  private_subnets = var.private_subnets_cidr
  public_subnets  = var.public_subnets_cidr

  enable_nat_gateway = true
  enable_vpn_gateway = true

  enable_dns_hostnames = true
  enable_dhcp_options              = true
  dhcp_options_domain_name         = "ec2.internal"
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]

   public_subnet_tags = {
    Name = var.public_subnet_tags
  }

  private_subnet_tags = {
    Name = var.private_subnet_tags
  }

  tags = {
    Terraform = "true"
    Environment = "POC"
    Name = "regular-vpc-terraform"
    Owner = "btomasd"
  }
}

