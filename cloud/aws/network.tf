resource "aws_vpc" "aws_main_vpc" {
  cidr_block = local.aws_network.cidr_block
  tags = {
    Name = local.aws_network.vpc_name
  }
}

resource "aws_subnet" "aws_subnets" {
  for_each          = { for subnet in local.aws_network.subnets : subnet.name => subnet }
  vpc_id            = aws_vpc.aws_main_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.value.name
  }
}