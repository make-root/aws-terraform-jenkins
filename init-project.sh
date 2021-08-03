#!/bin/bash

#Install project dependencies
if [  -n "$(cat /etc/os-release | grep Ubuntu)" ] && [ -n "$( cat /etc/os-release| grep 20\.04)" ]; then
    sudo apt-get update
#Install system utils    
    sudo apt install curl git
    echo ""
    sudo apt install terraform ansible awscli
    echo ""
    terraform --version
    echo ""
    ansible --version
    echo ""
    aws --version
    echo ""
    aws configure
    echo ""
    aws ec2 describe-instances
    echo ""
    sudo apt-get install -y python3-boto3 
    echo ""
    #Install packer
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install packer
    echo ""
    packer --version
    echo ""
else
    echo 'This OS still not supported. You should install terraform, ansible and awscli manually.'
fi  

#Install terraform bash autocomplite
terraform -install-autocomplete

#Add gitignore info
#https://github.com/github/gitignore/blob/master/Global/Ansible.gitignore
grep -qxF '*.retry' .gitignore || echo '*.retry' >> .gitignore

