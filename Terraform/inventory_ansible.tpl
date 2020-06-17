[management]
${mngm_ip}

[all:vars]
ansible_ssh_private_key_file = ${key_path}
ansible_ssh_user = ubuntu
ansible_python_interpreter = "/usr/bin/python3"
