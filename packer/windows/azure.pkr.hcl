#Points packer to use the Azure Resource Manager Builder which uses ARM to build images
source "azure-arm" "v" { 
    client_id           = var.client_id
    client_secret       = var.client_secret
    subscription_id     = var.subscription_id
    tenant_id           = var.tenant_id

    #Note: version management needs to be implementing for updating packages.
    location                            = "West Europe"
    managed_image_name                  = "aztf-ubuntu"
    managed_image_resource_group_name   = "rg-packer"

    communicator                        = "winrm"
    winrm_use_ssl                       = true
    winrm_insecure                      = true
    winrm_timeout                       = "5m"
    winrm_username                      = "packer"

    os_type                             = "Windows"
    image_offer                         = "WindowsServer"
    image_publisher                     = "MicrosoftWindowsServer"
    image_sku                           = "2016-Datacenter"

    vm_size                             = "Standard_B1ls"

    allowed_inbound_ip_addresses        = [var.allowed_inbound_ip] # Makes local machine able to connect to the VM to run provisioners
    
}