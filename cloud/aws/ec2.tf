resource "aws_instance" "aws_vm" {
  for_each      = { for idx, machine in local.aws_ec2 : idx => machine }
  ami          = each.value.ami
  instance_type = each.value.instance_type
  tags = {
    Name = each.value.name
  }
  depends_on = [aws_vpc.aws_main_vpc]
}