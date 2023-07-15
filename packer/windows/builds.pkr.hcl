 #Launches the VM runs the provisioners and captures an image
build {
    sources = [
        "source.azure-arm.v"
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
