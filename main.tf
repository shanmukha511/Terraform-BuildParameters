provider "azurerm" {

 subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
  client_id       =  "${var.client_id}"
  client_secret   =  "${var.client_secret}"
 
  
  }

resource "azurerm_resource_group" "pwc-test" {

 name     = "pwc-test"

 location = "eastus"

}

 

resource "azurerm_snapshot" "pwc-test" {

  name                = "pwc-snapshot_Windows"

  location            = "eastus"

  resource_group_name = "pwc-test"

  create_option       = "Copy"

  source_uri          =  "${params.source_uri}"

}

