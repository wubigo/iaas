provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_s3_bucket" "wubigo_com" {
  bucket = "s.wubigo.com"
  acl    = "public-read"
  policy = "${file("policy.json")}"

  website {
    index_document = "index.html"
    error_document = "404.html"

    
  }
}