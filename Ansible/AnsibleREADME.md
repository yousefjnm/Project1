The ansible


Command to run ansible playbook

ansible-playbook -i a.b.c.d, playbook-hello-world.yml (a.b.c.d -- is a public IP of an instance)

If get following error: 


TASK [Gathering Facts] ***************************************************************************************************************************************
fatal: [a.b.c.d]: FAILED! => {"changed": false, "module_stderr": "Shared connection to a.b.c.d closed.\r\n", "module_stdout": "/bin/sh: 1: /usr/local/bin/python3: not found\r\n", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 127}



Then run: 

ansible-playbook -i a.b.c.d, -e 'ansible_python_interpreter=/usr/bin/python3' playbook-hello-world.yml

(Just make sure, pythos3 is installed on the mentioned path of the instance, where you are trying to execute the playbook)
