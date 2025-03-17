data "xenorchestra_template" "template" {
  name_label = "Ubuntu Jammy Jellyfish 22.04"
}
data "xenorchestra_pool" "9J5" {
    name_label = "xcp-ng-9J5CXG2"
}
data "xenorchestra_network" "net" {
  name_label = "VLAN64"
}
