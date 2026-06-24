# Arun Azure Terraform Demo

Terraform configuration for provisioning a small Azure environment with reusable local modules.

# Resources

- Azure Resource Group
- Azure Virtual Networks
- Azure Public IP
- Azure Storage Account

# folder  Structure
.
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── public_ip/
    ├── resource_group/
    ├── storage_account/
    └── vnet/


# rerequisites

- Terraform installed
- Azure CLI installed and authenticated
- Access to the Azure subscription used for deployment
- Terraform Cloud access to organization `Arun_Org` and workspace `Arun-Azure-TF-Demo`
- Terrafrom Enveriornment varibles are defined in workspace 
