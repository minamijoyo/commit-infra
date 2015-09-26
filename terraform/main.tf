resource "aws_instance" "ap" {
    ami = "${lookup(var.aws_amis, var.aws_region)}"
    key_name = "${lookup(var.key_name, var.aws_region)}"
    instance_type = "t2.micro"
    availability_zone = "${lookup(var.availability_zone, var.aws_region)}"
    root_block_device {
      volume_type = "gp2"
      volume_size = 8
      delete_on_termination = true
    }
    monitoring = false
    disable_api_termination = false
    subnet_id  = "${lookup(var.subnet_id, var.aws_region)}"
    vpc_security_group_ids = ["${lookup(var.vpc_security_group_ids, var.aws_region)}"]
    associate_public_ip_address = true
    ebs_optimized = false
    tags {
        Name = "${var.ec2_tag_name}"
    }
}
