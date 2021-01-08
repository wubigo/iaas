terraform {
  required_providers {
    tencentcloud = {
      version = ">= 1.50.0"
      source = "terraform-providers/tencentcloud"
    }
  }
}

provider "tencentcloud" {
  secret_id  = "AKIDRggQvB3hspY6QUs5atxnNfmeRzvFuDo8"
  secret_key = "DCvNsHVUwlNkKekcCg9PPO7crvNYWE7l"
  region     = "ap-beijing"
  version = "1.50" 
}

resource "tencentcloud_instance" "work" {
        instance_name = "work"
        availability_zone = "ap-beijing-5"
        image_id = "img-oikl1tzv"
        instance_type = "SA2.2XLARGE32"
        system_disk_type = "CLOUD_PREMIUM"
      
        security_groups = [
            "sg-ik1d8mut"
        ]

        password = "!Qaz3edc4Rf%"

        vpc_id = "vpc-gbxpl3tu"
        subnet_id = "subnet-03b08pfj"
        # internet_max_bandwidth_out = 10
        # count = 3
}

output "instance_work_id" {
  description = "List of the instance id"
  value       = "${tencentcloud_instance.work.id}"
}
output "public_work_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = "${tencentcloud_instance.work.public_ip}"
}