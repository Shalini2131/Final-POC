variable "instance_type" {
  default = "t2.micro"
}

variable "iam_instance_profile" {
  default = "arn:aws:iam::576467192933:instance-profile/ecsInstanceRole"
}

variable "ami" {
  default = "ami-0cc6b8cf3ed4d3ac0"
}
variable "app_name" {
  type        = string
  description = "Application Name"
}

variable "app_environment" {
  type        = string
  description = "Application Environment"
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnets"
}

variable "private_subnets" {
  description = "List of private subnets"
}

variable "availability_zones" {
  description = "List of availability zones"
}

variable "access_key" {
  
}
variable "secret_key" {
  
}