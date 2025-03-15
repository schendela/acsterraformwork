# vm.tf
resource "xenorchestra_vm" "imported" {
 affinity_host      = null
    auto_poweron       = false
    #blocked_operations = []
    cpus               = 4
    exp_nested_hvm     = false
    high_availability  = null
    hvm_boot_firmware  = "bios"
    id                 = "061f649b-f64f-b47b-5d24-d96528d44317"
    #ipv4_addresses     = []
    #ipv6_addresses     = []
    memory_max         = 8589934592
    name_description   = "Server built for jitsi"
    name_label         = "jitsi-server"
    power_state        = "Running"
    resource_set       = null
    start_delay        = 0
    #tags               = []
    template = data.xenorchestra_template.template.id
    vga                = "std"
    videoram           = 8

    disk {
        attached         = true
        name_description = "Created by XO"
        name_label       = "jitsi-server"
        position         = "0"
        size             = 107374182400
        sr_id            = "6f710bd3-cd24-d6ac-f7e9-8c076239172f"
        vbd_id           = "e4ab9536-01c5-20bf-8277-7f23cfadfa93"
        vdi_id           = "21467863-b643-4b42-a6ec-998c842b3037"
    }

    network {
        attached       = true
        device         = "0"
     #   ipv4_addresses = []
      #  ipv6_addresses = []
        mac_address    = "96:3f:33:da:b9:b7"
        network_id     = "7d96b6ed-434b-0760-a49b-dd6412358fc0"
    }
}
