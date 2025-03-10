module "aws" {
  source = "./cloud/aws"
}

module "gcp" {
  source = "./cloud/gcp"
}

module "azure" {
  source = "./cloud/azure"
}

module "orchestra" {
  source = "./cloud/orchestra"
}