resource "aws_instance" "vaultsrv01" {
  ami                         = "ami-0022f774911c1d690"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.vault-subnet-primary.id
  vpc_security_group_ids      = [aws_security_group.vaultsg.id]
  key_name                    = aws_key_pair.keys.key_name
  associate_public_ip_address = true

  tags = {
    Name = "vaultsrv-01"
  }
}

resource "aws_key_pair" "keys" {
  key_name   = var.pubkeyname
  public_key = var.pubkey
}
