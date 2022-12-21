data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_iam_openid_connect_provider" "this" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}

data "kubectl_file_documents" "clusterrole" {
  content = "${path.module}/files/ClusterRole.yaml"
}

data "kubectl_file_documents" "clusterrolebinding" {
  content = "${path.module}/files/ClusterRoleBinding.yaml"
}

data "kubectl_file_documents" "rolebinding" {
  content = "${path.module}/files/RoleBinding.yaml"
}

data "kubectl_file_documents" "role" {
  content = "${path.module}/files/Role.yaml"
}

data "kubectl_file_documents" "namespace" {
  content = "${path.module}/files/Namespace.yaml"
}
