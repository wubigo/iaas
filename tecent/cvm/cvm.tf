terraform {
  required_providers {
    tencentcloud = {
      version = ">= 1.50.0"
      source = "terraform-providers/tencentcloud"
    }
  }
}

provider "tencentcloud" {
  secret_id  = ""
  secret_key = ""
  region     = "ap-beijing"
  version = "1.50" 
}


resource "tencentcloud_instance" "cvm_test" {
        instance_name = "cvm-test"
        availability_zone = "ap-beijing-5"
        image_id = "img-oikl1tzv"
        instance_type = "SA2.MEDIUM4"
        system_disk_type = "CLOUD_PREMIUM"
      
        security_groups = [
            "sg-gtmiok8v"
        ]

        password = "!Qaz3edc4Rf%"

        vpc_id = "vpc-ip7ok40a"
        subnet_id = "subnet-kvubcpq1"
        internet_max_bandwidth_out = 10
        #count = 1
}

output "instance_id" {
  description = "List of the instance id"
  value       = "${tencentcloud_instance.cvm_test.id}"
}
output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = "${tencentcloud_instance.cvm_test.public_ip}"
}