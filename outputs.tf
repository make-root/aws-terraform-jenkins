
output "Jenkins-Main-Node-Public-IP" {
  value = aws_instance.jenkins_master_server.public_ip
}