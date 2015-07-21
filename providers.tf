variable "do_token" {}
variable "etcd_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}
