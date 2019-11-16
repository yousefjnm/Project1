# Ansible Playbooks

The following 2 playbooks will configure and install Snipe-IT on the webserver. They should be ran in the following order:

- SnipeitWebSrvSC.yml
- SnipeitInstall.yml

The playbooks can be ran all together by instead calling the Master.yml file.

Note: once you have cloned the repo or copied the files make sure to rename the env file to .env

# Playbook processes

The first playbook will install the necessary software and configure the webserver.
The second playbook will Install Snipe-It and generate its database.

The playbooks are dependent on the env and snipeit-site.conf to be properly installed. The env is actually a hidden file and will need to be renamed to ".env" otherwise the env file task will not complete. 

