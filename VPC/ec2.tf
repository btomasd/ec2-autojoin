module "ec2-maincontroller" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two"])

  name = "Win2019-AD-DomainController-${each.key}"

  ami                    = "ami-0fcea9534c0257ede" #windows 2019
  instance_type          = "t2.micro"
  key_name               = "win-domc"
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.allow_RDP.id] #tomásSG and AD-SG
#  subnet_id              = module.vpc.private_subnets[0]
  subnet_id              = module.vpc.public_subnets[0]
 
  tags = {
    Name = "Win2019-AD-DomainController-${each.key}"
    Issue = "35"
    Owner = "btomasd"
    Terraform = "true"
    adjoin = "false" #tojoin into AD
  }

  


}


