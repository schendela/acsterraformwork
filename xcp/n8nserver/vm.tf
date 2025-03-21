resource "xenorchestra_vm" "n8n" {
    memory_max = 8589934592
    cpus  = 2
    #cloud_config = xenorchestra_cloud_config.bar.template
    name_label = "n8n-server"
    name_description = "Ubuntu server. Running docker. N8N Server"
    template = data.xenorchestra_template.ubuntu.id
 #   cdrom = data.xenorchestra_vdi.vdi.id
 #   cdrom {
#	id = data.xenorchestra_vdi.vdi.id
#}
    provisioner "local-exec" {
	command = "sudo hostnamectl set-hostname n8n.grapelandisd.local"
    }
    # Prefer to run the VM on the primary pool instance
    affinity_host = data.xenorchestra_pool.testhost.master
    network {
      network_id = data.xenorchestra_network.net.id
    }
    disk {
      sr_id = "6f710bd3-cd24-d6ac-f7e9-8c076239172f"
      name_label = "n8ntest"
      size = 64424509440
    }

    tags = [
      "Ubuntu",
      "Bionic",
    ]

    // Override the default create timeout from 5 mins to 20.
    timeouts {
      create = "20m"
    }
}
