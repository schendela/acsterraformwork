resource "xenorchestra_vm" "n8n" {
    memory_max = 8589934592
    cpus  = 2
    name_description = "Ubuntu server. Running docker. N8N Server"
    template = data.xenorchestra_template.ubuntu.id
    network {
      network_id = data.xenorchestra_network.net.id
    }
    disk {
      sr_id = "6f710bd3-cd24-d6ac-f7e9-8c076239172f"
      name_label = "n8ntestserver"
      size = 64424509440
    }

    tags = [
      "Ubuntu",
      "snapshot",
    ]

    // Override the default create timeout from 5 mins to 20.
    timeouts {
      create = "20m"
    }
}
