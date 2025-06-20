module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = var.vpc_name
  cidr    = var.vpc_cidr_block
  azs     = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  enable_nat_gateway = true
  single_nat_gateway = true
  tags = {
    Name = "ecs-vpc"
  }
}

module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws"
  name    = var.cluster_name
  capacity_providers = ["FARGATE"]
  create_cluster = true
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  name    = "ecs-alb"
  load_balancer_type = "application"
  subnets = module.vpc.public_subnets
  vpc_id = module.vpc.vpc_id
  security_groups = [aws_security_group.lb_sg.id]
}

# Add ECS Task and Service module here (or directly inline)

