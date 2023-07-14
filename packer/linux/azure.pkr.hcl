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

    communicator                        = "ssh"
    os_type                             = "Linux"
    image_offer                         = "UbtunuServer"
    image_publisher                     = "Canonical"
    image_sku                           = "18.04-LTS"

    vm_size                             = "Standard_D2s_v2"

    allowed_inbound_ip_addresses        = [var.allowed_inbound_ip] # Makes local machine able to connect to the VM to run provisioners
    
}