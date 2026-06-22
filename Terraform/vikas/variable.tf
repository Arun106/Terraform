#BELOW IS FOR RESOURCE-GROUP

variable "RG_NAME" {

  type = string

}

variable "RG_LOCATION" {

  type = string

}


#BELOW IS NSG

variable "NSG_NAME1" {

  type = string


}

#BELOW IS VNET & SUBNET


variable "VNET1" {

  type = object({

    vnetname      = string
    address_space = list(string)

  })

}


variable "SUBNETS" {

  type = map(object({

    subnetname       = string
    address_prefixes = list(string)


  }))

}


#BELOW IS NIC

variable "NIC" {

  type = object({

    nicname    = string
    ipname     = string
    private_ip = string

  })

}









