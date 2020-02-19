
  resource "aws_codedeploy_app" "my_aws_codedeploy_app" {

    name             = var.var_aws_codedeploy_app_name
    compute_platform = var.var_aws_codedeploy_app_compute_platform

  }