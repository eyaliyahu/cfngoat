resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name      = "dev"
    yor_name  = "dev-vpc"
    yor_trace = "14f3bac9-16e0-4bd4-878f-f45514a0cfdf"
  }
}
