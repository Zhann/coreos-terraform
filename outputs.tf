output "public_ipv4_nodes" {
  value = "${join(" ", digitalocean_droplet.coreos_node.*.ipv4_address)}"
}

output "private_ipv4_nodes" {
  value = "${join(" ", digitalocean_droplet.coreos_node.*.ipv4_address_private)}"
}
