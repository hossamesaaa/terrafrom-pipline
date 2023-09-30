 resource "tls_private_key" "ssh_rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key_pub"
  public_key=tls_private_key.ssh_rsa.public_key_openssh
}


resource "local_file" "tf_key" {
  content  = tls_private_key.ssh_rsa.private_key_pem
  filename = "private_key.pem"
}


# output "private_key" {
#   value = tls_private_key.ssh_key.private_key_pem
#   sensitive=true
# }

# output "public_key" {
#   value = tls_private_key.ssh_key.public_key_openssh
#   sensitive=true
# }

# generate public and private key pair 
# resource "tls_private_key" "rsa-key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# # create aws key pair by public key from tls_private_key
# resource "aws_key_pair" "tf-key-pair" {
#   key_name   = "tf-key-pair"
#   public_key = tls_private_key.rsa-key.public_key_openssh
# }

# # store private key pair into my machine to use it with ssh connect 
# resource "local_file" "tf-key" {
#   content  = tls_private_key.rsa-key.private_key_pem
#   filename = "tf-key-pair.pem"
# }