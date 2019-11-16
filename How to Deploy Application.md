# Snipe-It Application Deployment 

Deployment for the application Snipe-It is fairly simple and utilizes ansible to run all the task necessary to install the application. 

The ansible directory contains all the necessary files. To install the application in one shot run the following command from the directory in which you have decided to place all the files. 

$ansible-playbook master.yml

If you would like a more controlled install you can choose to run each playbook individually by running the following commands:

$ansible-playbook SnipeitWebSrvSC.yml

$ansible-playbook SnipeitInstall.yml
