# Resource-2: Create Network Interface
resource "azurerm_network_interface" "web_linuxvm_nic" {
  count               = var.web_linuxvm_instance_count
  name                = "${local.resource_name_prefix}-web-linuxvm-nic-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "web-linuxvm-ip-1"  ## Can use same ip config name as they are associated with different NICs
  # name                          = "web-linuxvm-ip-${count.index}"  ## But for better clarity, we can use different names.
    subnet_id                     = azurerm_subnet.websubnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.web_linuxvm_publicip.id
  }
}

