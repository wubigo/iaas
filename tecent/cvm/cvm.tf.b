terraform {
  required_providers {
    tencentcloud = {
      version = ">= 1.50.0"
      source = "terraform-providers/tencentcloud"
    }
  }
}

provider "tencentcloud" {
  secret_id  = "AKID64gO0VD06ZswsbfSgkeQyLZcUG0bxypB"
  secret_key = "tmTv98tUek12uZ6bdefw332l4f4Dahok"
  region     = "ap-beijing"
  version = "1.50" 
}


resource "tencentcloud_instance" "front" {
        instance_name = "cvm-test"
        availability_zone = "ap-beijing-5"
        image_id = "img-oikl1tzv"
        instance_type = "SA2.MEDIUM4"
        system_disk_type = "CLOUD_PREMIUM"
      
        security_groups = [
            "sg-ik1d8mut"
        ]

        password = "!Qaz3edc4Rf%"

        vpc_id = "vpc-gbxpl3tu"
        subnet_id = "subnet-03b08pfj"
        # internet_max_bandwidth_out = 10
        # count = 1
}

output "instance_id" {
  description = "List of the instance id"
  value       = "${tencentcloud_instance.front.id}"
}
output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = "${tencentcloud_instance.front.public_ip}"
}