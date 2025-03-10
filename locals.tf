locals {
  # 🌍 AWS YAML
  aws_network   = yamldecode(file("./cloud/aws/network.yaml"))["aws_network"]
  aws_s3        = yamldecode(file("./cloud/aws/s3.yaml"))["aws_s3"]
  aws_ec2       = yamldecode(file("./cloud/aws/ec2.yaml"))["aws_ec2"]

  # ☁️ GCP YAML
  gcp_network   = yamldecode(file("./cloud/gcp/network.yaml"))["gcp_network"]
  gcp_storage   = yamldecode(file("./cloud/gcp/storage.yaml"))["gcp_storage"]
  gcp_compute   = yamldecode(file("./cloud/gcp/compute.yaml"))["gcp_compute"]

  # 🔵 AZURE YAML
  azure_network = yamldecode(file("./cloud/azure/network.yaml"))["azure_network"]
  azure_storage = yamldecode(file("./cloud/azure/storage.yaml"))["azure_storage"]
  azure_vm      = yamldecode(file("./cloud/azure/vm.yaml"))["azure_vm"]

  # 🎼 ORCHESTRATION YAML
  harmony             = yamldecode(file("./cloud/orchestra/harmony.yaml"))["harmony"]
  interconnect        = local.harmony["interconnect"]
}
