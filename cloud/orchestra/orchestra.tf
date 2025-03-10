module "aws" {
  source = "../aws"
}

module "gcp" {
  source = "../gcp"
}

module "azure" {
  source = "../azure"
}

resource "aws_vpc_peering_connection" "aws_gcp_peering" {
  vpc_id        = module.aws.vpc_id
  peer_vpc_id   = module.gcp.network_id 
  auto_accept   = true
  provider      = aws
}

resource "google_compute_network_peering" "gcp_azure_peering" {
  name         = "gcp-azure-peering"
  network      = module.gcp.network_id  
  peer_network = module.azure.vnet_id   
}