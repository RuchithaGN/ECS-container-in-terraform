variable "vpc_name" { default = "ecs-vpc" }
variable "vpc_cidr_block" { default = "10.0.0.0/16" }
variable "azs" { default = ["us-east-1a", "us-east-1b"] }
variable "public_subnets" { default = ["10.0.1.0/24", "10.0.2.0/24"] }
variable "private_subnets" { default = ["10.0.3.0/24", "10.0.4.0/24"] }
variable "cluster_name" { default = "ecs-cluster" }
