variable "aws_region" {
  description = "AWS region to deploy resources in"
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  default     = "default"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "CIDR for the public subnet"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable "key_name" {
  description = "Existing EC2 KeyPair for SSH access"
  default     = "Terraform-Practice"
}
