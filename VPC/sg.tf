resource "aws_security_group" "allow_RDP" {

  name        = "allow_RDP"
  description = "Allow RDP inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["152.170.81.99/32"]
  }

  ingress {
    description      = "ICMP"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "LDAP, Group Membership, GC Search"
    from_port        = 3268
    to_port          = 3268
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "Kerberos Authentication"
    from_port        = 88
    to_port          = 88
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "Active Directory Web Services"
    from_port        = 9389
    to_port          = 9389
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "AD Global Catalog"
    from_port        = 3269
    to_port          = 3269
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "LDAP TCP"
    from_port        = 389
    to_port          = 389
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "LDAP UDP"
    from_port        = 389
    to_port          = 389
    protocol         = "udp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "LDAP SSL"
    from_port        = 636
    to_port          = 636
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "NAT-T"
    from_port        = 4500
    to_port          = 4500
    protocol         = "udp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "RPC"
    from_port        = 135
    to_port          = 135
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "RPC UDP"
    from_port        = 135
    to_port          = 135
    protocol         = "udp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "RPC randomly allocated high TCP ports"
    from_port        = 1024
    to_port          = 5000
    protocol         = "udp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "RPC randomly allocated high TCP ports 2"
    from_port        = 49152
    to_port          = 65535
    protocol         = "udp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "SMB, Authenticated communication between Server and Domain Controllers"
    from_port        = 445
    to_port          = 445
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "DNS"
    from_port        = 53
    to_port          = 53
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  ingress {
    description      = "DNS UDP"
    from_port        = 53
    to_port          = 53
    protocol         = "udp"
    cidr_blocks      = ["10.0.0.0/8"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 tags = {
    Name = "Allow-RDP-SG"
    Owner = "btomasd"
    Terraform = "true"
  }
}