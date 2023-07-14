build {
    sources = [
        "source.azure-arm.vm"
    ]

  provisioner "shell" {
    execute_command = local.execute_command
    inline = ["apt update"]
  }

  provisioner "shell" {
    # This is a workaround for a bug in the Azure Linux agent
    execute_command = local.execute_command
    inline = ["/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"]
    only = ["azure-arm"]
  }

}
