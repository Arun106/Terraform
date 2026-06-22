#BELOW is for ResourceGroup

RG_NAME     = "Terraform-RG"
RG_LOCATION = "east us"


#BELOW IS NSG


NSG_NAME1 = "Terraform_NSG"



#BELOW IS VNET & SUBNET

VNET1 = {

  vnetname      = "Terraform_VNet"
  address_space = ["10.0.0.0/16", "194.78.97.0"]

}

SUBNETS = {


  SUBNET1 = {

    subnetname       = "TERRAFORM_SUBNET1"
    address_prefixes = ["10.0.1.0/26"]

  }

  SUBNET2 = {

    subnetname       = "TERRAFORM_SUBNET2"
    address_prefixes = ["10.0.4.0/22"]

  }
}

#BELOW IS MY NIC



NIC = {

  nicname    = "TERRAFORM-NIC"
  ipname     = "TERRAFORM-IP"
  private_ip = "Dynamic"

}
