terraform {
  required_version = "1.15.6"

  cloud {

    organization = "Vikas-Vicky"

    workspaces {
      name = "Vikas-demo-workspace"
    }
  }
}
