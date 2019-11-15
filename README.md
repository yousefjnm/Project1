# Project1 Overview

In this repository you will find all the necessary files to create resrouces in AWS that will allow you to host Snipe-IT Assetmanagement on an EC2 instance. The resources are comprised on Terraform code and Ansible playbooks. 

The following resources are created in AWS via Terraform files:

 - IAM Roles
 - VPC resources
 - EC2
 - Application Load Balancer
 - Route 53 records
 - State & Locking
 - Bastion (Jump Box)
 - LAMBDA
 
 Tha Ansible playbooks perform the task below which upon completion installs a usable Snipe-IT Asset Management web application.
 
  - Installs the necessary software/dependencies for the installation of Snipe-IT
  - Installs Snipe-It, creates a database, and generates the needed configuration files.
  
  
 # Project1 Running files
 
 Terraform:
      All of the Terraform files must be included in the directroy otherwise the AWS resources will not be created correctly. In the directory run the following command to verify that the files and their syntax is correct.
 
  - $terraform init       (initializes the directory to be usable with Terraform)
  - $terraform plan       (verifies and displays the resources that will be created in AWS)
  
  - $terraform apply      (will run the terraform files and create the resources
  
  Ansible:
        Playbooks are ran using the ansible host file or dynamic inventory (you must make sure to have the host file or dynamic inventory configured). While there is a total of 2 playbooks you can run both by calling the Master.yml file using the following commands:
        
  - $ansible-playbook Master.yml
Or
  - $ansible-playbook SnipeitWebSrvSC.yml
  - $ansible-playbook SnipeitInstall.yml
  
  
  
  
