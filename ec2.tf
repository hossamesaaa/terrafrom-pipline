data "aws_ami" "amazon-linux-2" {
 most_recent = true


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}


resource "aws_instance" "bastion" {
  instance_type     = var.instance_types   
  associate_public_ip_address = true
  ami                = data.aws_ami.amazon-linux-2.id
 # ami               = "ami-06e46074ae430fba6"
  key_name          = aws_key_pair.ssh_key.id
  subnet_id         = module.network-mod.pub_subnets[0].id
  vpc_security_group_ids   = [aws_security_group.allow_ssh.id]
  
   provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }
  
  user_data = <<-EOF
  #!/bin/bash
   echo '${tls_private_key.ssh_rsa.private_key_pem}'  > /home/ec2-user/test.pem
   chmod 400 /home/ec2-user/test.pem
   sudo chown ec2-user:ec2-user test.pem
  EOF

#   user_data = <<-EOF
#               #!/bin/bash
#                 echo '${tls_private_key.ssh_rsa.private_key_pem}' > /home/ec2-user/private.pem
#                 chmod 400 private.pem
#              EOF

  tags = {
    "Name" = "bastion-hossam"
  }
}



resource "aws_instance" "application" {
  ami                = data.aws_ami.amazon-linux-2.id
  #ami               = "ami-06e46074ae430fba6"
  instance_type     = var.instance_types 
  subnet_id         = module.network-mod.priv_subnets[0].id
  key_name          = aws_key_pair.ssh_key.id
  availability_zone = "us-east-1a"
  vpc_security_group_ids   = [aws_security_group.allow_ssh_and_port.id]

  tags = {
    Name = "application-hossam"
  }
}