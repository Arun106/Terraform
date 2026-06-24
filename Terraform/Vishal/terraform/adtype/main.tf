terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
}

module "developer_user" {
  source = "./modules/random_user"

  prefix = "dev"
  length = 6
}

output "developer_username" {
  value = module.developer_user.username
}
