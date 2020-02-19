
# Main

resource "aws_codedeploy_deployment_config" "my_aws_codedeploy_deployment_config" {
	
# Required
  
  deployment_config_name = var.var_aws_codedeploy_deployment_config.deployment_config_name

# Optional

  compute_platform       = var.var_aws_codedeploy_deployment_config.compute_platform


# Blocks

# minimum_healthy_hosts

  dynamic "minimum_healthy_hosts" {
    for_each = var.var_minimum_healthy_hosts.create ? [1] : []

    content {
      type               = var.var_minimum_healthy_hosts.type
      value              = var.var_minimum_healthy_hosts.value
    }
  }


# traffic_routing_config

  dynamic "traffic_routing_config" {
    for_each = var.var_traffic_routing_config.create ? [1] : []

    content {
      type               = var.var_traffic_routing_config.type


### time_based_canary

      dynamic "time_based_canary" {
        for_each = var.var_time_based_canary.create ? [1] : []

        content {
          interval       = var.var_time_based_canary.interval
          percentage     = var.var_time_based_canary.percentage
        }
      }


### time_based_linear

      dynamic "time_based_linear" {
        for_each = var.var_time_based_linear.create ? [1] : []

        content {
          interval       = var.var_time_based_linear.interval
          percentage     = var.var_time_based_linear.percentage
        }
      }

    }
  }
  
}