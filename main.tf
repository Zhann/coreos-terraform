resource "template_file" "cloud_config" {
  filename = "conf/cloud-config.yml"

  vars {
    token = "${var.etcd_token}"
  }
}

resource "digitalocean_droplet" "coreos_node" {
  image = "coreos-stable"
  name = "coreos-${count.index}"
  count = 3
  region = "ams3"
  size = "512mb"
  private_networking = true
  ssh_keys = [
    "b3:32:ab:16:e9:87:f9:52:68:64:42:7f:24:da:cf:70"
  ]
  user_data = "${template_file.cloud_config.rendered}"

  connection {
    user = "core"
  }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo iptables-restore /var/lib/iptables/rules-save",
#     ]
#   }
}
