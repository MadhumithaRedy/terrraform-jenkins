provider "aws" {
  region        ="ap-south-1"
  access_key    ="AKIAVO3XMLTOFMG35PHE"
  secret_key    ="qOk/3YhABgffnLmTe71BHmcR3qmsbuiD9mzEaCt9"
}
resource "aws_s3_bucket" "example" {
  bucket	= "mybucket788"
}
