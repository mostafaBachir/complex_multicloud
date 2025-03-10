locals {
  aws_network = yamldecode(file("${path.module}/network.yaml"))["aws_network"]
  aws_s3      = yamldecode(file("${path.module}/s3.yaml"))["aws_s3"]
  aws_ec2     = yamldecode(file("${path.module}/ec2.yaml"))["aws_ec2"]
}