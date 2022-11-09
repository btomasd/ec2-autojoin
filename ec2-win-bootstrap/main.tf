#test server - TODO: Test this using terragrunt

resource "aws_instance" "server" {

#  ami                         = data.aws_ami.windows-2022.id
  ami                         = "ami-0fcea9534c0257ede"
#  instance_type               = var.api_instance_size
  instance_type               = "t2.micro"
  subnet_id                   = ""
#  subnet_id                   = data.aws_vpc.selected.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [""]
#  vpc_security_group_ids      = [data.aws_security_group.selected]
  source_dest_check           = false
  #key_name                    = aws_key_pair.key_pair.key_name
  key_name                    = "win-ad-enabled"
  user_data                   = data.template_file.bootstrap_templatefile.rendered
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.id  # root disk
  
#  root_block_device {
#    volume_size           = var.root_volume_size
#    volume_type           = var.root_volume_type
#    delete_on_termination = true
#  }  

  tags = {
    Name        = var.server_name
    Environment = var.app_environment
    Owner       = var.owner
  }  
  
  volume_tags = {
    Name        = var.server_name
    Environment = var.app_environment
    Owner       = var.owner
  }

  metadata_options {
  http_endpoint = "enabled"
  instance_metadata_tags = "enabled"
  } 





}