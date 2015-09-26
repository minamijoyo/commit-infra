variable "aws_region" {
    default = "ap-northeast-1"
}

variable "aws_amis" {
    default = {
        "ap-northeast-1" = "ami-18869819"
    }
}

variable "key_name" {
    default = {
        "ap-northeast-1" = "aws-login"
    }
}

variable "availability_zone" {
    default = {
        "ap-northeast-1" = "ap-northeast-1a"
      }
}

variable "subnet_id" {
    default = {
        "ap-northeast-1" = "subnet-6b55851c"
    }
}

variable "vpc_security_group_ids" {
    default = {
        "ap-northeast-1" = "sg-48b7002d"
    }
}

variable "ec2_tag_name" {
    default = "commitm-ap-04"
}
