# Bootstrapping PowerShell Script

data "template_file" "bootstrap_templatefile" {

  template = file("${path.module}/join.ps1")  
  vars = {
    ad_secret_id = "AD/MainAccounts/DomainJoin"
    ad_domain = "terraform.int"
    dns = "10.32.135.214"
  }

}

data "aws_vpc" "selected" {

  filter {
    name = "tag:Name"
    values = ["regular-vpc-terraform"]
  }
}

data "aws_security_group" "selected" {

  filter {
    name = "tag:Name"
    values = ["Allow-RDP-SG"]
  }

}