resource "aws_iam_role" "cluster_role" {
  name = "${local.eks_cluster_name}-cluster-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = <<POLICY
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "eks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
    }
    POLICY

  tags = local.common_tags
}


resource "aws_iam_role_policy_attachment" "eks-demo-AmazonEKSClusterPolicy" {
  role       = aws_eks_cluster.cluster_rolename
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks-demo-AmazonEKSVPCResourceController" {
  role       = aws_eks_cluster.cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}