data "xenorchestra_template" "ubuntu" {
  name_label = "Ubuntu Jammy Jellyfish 22.04"
  pool_id = data.xenorchestra_pool.testhost.id
}
data "xenorchestra_pool" "testhost" {
    name_label = "xcp-ng-9J5CXG2"
}
data "xenorchestra_network" "net" {
  name_label = "VLAN64"
}
data "xenorchestra_vdi" "vdi" {
  name_label = "ubuntu-24.04.1-live-server-amd64.iso"
}
