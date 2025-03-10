resource "aws_s3_bucket" "aws_bucket" {
  for_each = { for idx, bucket in local.aws_s3 : idx => bucket }
  bucket   = each.value.name
  tags = {
    Name = each.value.name
  }
}