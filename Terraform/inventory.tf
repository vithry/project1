data "template_file" "inventory_ansible" {
  template = "${file("inventory_ansible.tpl")}"

  vars {
    mngm_ip  = "${aws_instance.Server1.public_ip}"
    key_path = "${var.instance_key_path}"
  }
}

resource "null_resource" "update_ansible_inventory" {

  triggers {
    template = data.template_file.inventory_ansible.rendered
  }

  provisioner "local-exec" {
    command = "mkdir -p ../ansible/playbook/'${lower(var.project_name)}'/'${lower(var.project_env)}' && echo '${data.template_file.inventory_ansible.rendered}' > ../ansible/playbook/'${lower(var.project_name)}'/'${lower(var.project_env)}'/inventory"
  }
}
