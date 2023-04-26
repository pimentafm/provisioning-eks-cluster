module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"

  cluster_name    = local.cluster_name
  cluster_version = "1.26"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

    attach_cluster_primary_security_group = true

    # Disabling and using externally provided security groups
    create_security_group = false
  }

  eks_managed_node_groups = {
    one = {
      name          = "node-group-1"
      capacity_type = "SPOT"

      instance_types = ["t3.small"]
      # instance_types = ["t3.medium"] # alteracao para a aula 7.2

      min_size     = 1
      max_size     = 3
      desired_size = 3

      vpc_security_group_ids = [
        aws_security_group.node_group_one.id
      ]
    }
  }
}
