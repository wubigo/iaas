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


data "tencentcloud_ami" "ubuntu" {
  most_recent = true

  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "tencentcloud_instance" "sls" {
    # ami = "${data.tencentcloud_ami.ubuntu.id}"
    ami = "ami-0aa7c595324d25274"
    # ami = "ami-0dbf5ea29a7fc7e05"
    instance_type = "t2.micro"
    
    
    network_interface {
      network_interface_id = "${tencentcloud_network_interface.nic.id}"
      device_index         = 0
    }
    # network_interface {
    #   network_interface_id = "${tencentcloud_network_interface.eth1.id}"
    #   device_index         = 1
    # }

    # subnet_id = "subnet-442fc81e"
    # vpc_security_group_ids = [ "sg-080e882a71e66c55f", "sg-e8c28e96" ]
    # key_name = "bigo-us"
    key_name = "bigo"

    root_block_device {
      volume_type           = "gp2"
      volume_size           = "8"
      delete_on_termination = "true"
    }

    user_data = "${file("attach_ebs.sh")}"

    tags = {
        Name = "sls"
        Owner = "bigo"
        Env = "dev"
    }
}



resource "tencentcloud_network_interface" "nic" {
  subnet_id   = "subnet-08c5c805226066daa"
  security_groups  = [ "sg-0799255c98f0edbf7", "sg-044db67d975f0b833", "sg-0c4cf553b1db3448d" ]
  tags = {
    Name = "primary_network_interface"
  }
}

# resource "tencentcloud_network_interface" "eth1" {
#   subnet_id   = "subnet-0d2ba86ccf7420c77"
#   security_groups  = [ "sg-0799255c98f0edbf7", "sg-044db67d975f0b833" ]
#   tags = {
#     Name = "secondary_network_interface"
#   }
# }


# resource "tencentcloud_volume_attachment" "ebs_att" {
#   device_name = "/dev/xvdf"
#   volume_id   = "vol-097c65f161e1ccdeb"
#   instance_id = "${tencentcloud_instance.sls.id}"
# }


output "instance_id" {
  description = "List of the instance id"
  value       = "${tencentcloud_instance.sls.id}"
}
output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = "${tencentcloud_instance.sls.public_ip}"
}