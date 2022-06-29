variable "storageaccountname"{
 type=string
 default="sa001shiva"
}
variable "resourcegroupname"{
 type=string
 default="rg-terraform"
}
variable "location"{
 type=string
 default="East Asia"
}

terraform {
 required_providers{
   azurerm={
    source ="hashicorp/azurerm"
    version= "=3.5.0"
  }
 }
}

provider "azurerm"{
subscription_id = "a351e5f7-5b35-4b92-a50d-7d74fdc36b5e"
tenant_id = "7f8942e4-0297-4bb9-ac54-6eae9582fa4b"
features{}
}

resource "azurerm_resource_group" "group"{
 name = var.resourcegroupname
 location = var.location
 }
 
resource "azurerm_storage_account" "storage"{
 name= var.storageaccountname
 resource_group_name= azurerm_resource_group.group.name
 location=  azurerm_resource_group.group.location
 account_tier= "Standard"
 account_replication_type= "LRS"
}
 
