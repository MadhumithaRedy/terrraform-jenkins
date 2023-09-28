provider "aws" {
  region        ="ap-south-1"
  access_key    ="AKIAVO3XMLTOFMG35PHE"
  secret_key    ="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"
}
resource "aws_vpc" "vpc" {
 cidr_block	= "10.0.0/16"
 tags = {
 Name = "madhu_vpc"
}
}
 resource "aws_subnet" "subnet" {
 vpc_id		= aws_vpc.vpc.id
 cidr_block	="10.0.${count.index+1}.0/24"
 tags = {
  Name	= "madhu_subnet-${count.index+1}"
}
}
 resource "aws_route_table" "route_table" {
 count =2
 vpc_id	= aws_vpc.vpc.id
 route {
	cidr_block	= "0.0.0./0"
	gateway_id	= aws_internet_gateway.gateway.id
}
 tags	= {
	Name = "madhu_route_table-${count.index+1}"
}
}
 resource "aws_internet_gateway" "gateway" {
 vpc_id	= aws_vpc.vpc.id
	tags = {
	 Name = "madhu_internet_gateway"
}
}
