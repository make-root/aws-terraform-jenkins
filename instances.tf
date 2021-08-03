resource "aws_key_pair" "ssh-access-key" {
  key_name   = "ssh-access-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "jenkins_master_server" {
  ami                    = "ami-087e0abd1c57a1d51"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  user_data              = file("jenkins-install.sh")
  key_name               = "ssh-access-key"

  tags = {
    Name = "Jenkins server"
  }
}