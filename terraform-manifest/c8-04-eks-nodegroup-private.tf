resource "aws_eks_node_group" "eks_ng_private" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "${local.eks_cluster_name}-ng-private"
  node_role_arn   = aws_iam_role.cluster_ng_role.name
  subnet_ids      = module.vpc.private_subnets

  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  instance_types = ["${var.aws_inst_type}"]
  disk_size = 10

  remote_access {
    ec2_ssh_key = data.aws_key_pair.terraform_key.name
  }

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks-demo-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-demo-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-demo-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    Type = "Private-Node-Group"
  }
}