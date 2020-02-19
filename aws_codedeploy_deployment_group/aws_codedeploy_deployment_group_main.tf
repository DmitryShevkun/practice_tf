
resource "aws_codedeploy_deployment_group" "my_aws_codedeploy_deployment_group" {


  # Required

  app_name               = var.var_aws_codedeploy_deployment_group_main.app_name
  deployment_group_name  = var.var_aws_codedeploy_deployment_group_main.deployment_group_name
  service_role_arn       = var.var_aws_codedeploy_deployment_group_main.service_role_arn


  # Optional

  autoscaling_groups     = var.var_aws_codedeploy_deployment_group_main.autoscaling_groups
  deployment_config_name = var.var_aws_codedeploy_deployment_group_main.deployment_config_name


##############################     Nested Blocks     ##############################

# alarm_configuration

  dynamic "alarm_configuration" {
    for_each = var.var_alarm_configuration.create ? [1] : []

    content {
      enabled                   = var.var_alarm_configuration.enabled
      ignore_poll_alarm_failure = var.var_alarm_configuration.ignore_poll_alarm_failure
      alarms                    = var.var_alarm_configuration.alarms
    }
  }


# auto_rollback_configuration 

  dynamic "auto_rollback_configuration" {
    for_each = var.var_auto_rollback_configuration.create ? [1] : []

    content {
      enabled = var.var_auto_rollback_configuration.enabled
      events  = var.var_auto_rollback_configuration.events
    }
  }


# deployment_style

  dynamic "deployment_style" {
    for_each = var.var_deployment_style.create ? [1] : []

    content {
      deployment_option = var.var_deployment_style.deployment_option
      deployment_type   = var.var_deployment_style.deployment_type
    }
  }


# ecs_service

  dynamic "ecs_service" {
    for_each = var.var_ecs_service.create ? [1] : []

    content {
      cluster_name = var.var_ecs_service.cluster_name
      service_name = var.var_ecs_service.service_name
    }
  }


# trigger_configuration

  dynamic "trigger_configuration" {
    for_each = var.var_trigger_configuration ? [1] : []

    content {
      trigger_name       = var.var_trigger_configuration.trigger_name
      trigger_target_arn = var.var_trigger_configuration.trigger_target_arn
      trigger_events     = var.var_trigger_configuration.trigger_events
    }
  }


##############################     blue_green_deployment_config block     ##############################

  dynamic "blue_green_deployment_config" {
    for_each = var.var_blue_green_deployment_config.create ? [1] : []

    content {
      
      dynamic "deployment_ready_option" {
        for_each = var.var_deployment_ready_option.create ? [1] : []

        content {
          action_on_timeout                = var.var_deployment_ready_option.action_on_timeout
          wait_time_in_minutes             = var.var_deployment_ready_option.wait_time_in_minutes
        }
      }

      dynamic "green_fleet_provisioning_option" {
        for_each = var.var_green_fleet_provisioning_option.create ? [1] : []

        content {
          action                           = var.var_green_fleet_provisioning_option.action
        }
      }

      dynamic "terminate_blue_instances_on_deployment_success" {
        for_each = var.var_terminate_blue_instances_on_deployment_success.create ? [1] : []

        content {
          action                           = var.var_terminate_blue_instances_on_deployment_success.action
          termination_wait_time_in_minutes = var.var_terminate_blue_instances_on_deployment_success.termination_wait_time_in_minutes
        }
      }

    }
  }


##############################     load_balancer_info block     ##############################

  dynamic "load_balancer_info" {
    for_each = var.var_load_balancer_info.create ? [1] : []

    content {

      dynamic "elb_info" {
        for_each = var.var_elb_info.create ? [1] : []

        content{
          name = var.var_elb_info.name
        }
      }

      dynamic "target_group_info" {
        for_each = var.var_target_group_info.create ? [1] : []

        content{
          name = var.var_target_group_info.name
        }
      }

      dynamic "target_group_pair_info" {
        for_each = var.var_target_group_pair_info.create ? [1] : []

        content{

          dynamic "prod_traffic_route" {
            for_each = var.var_target_group_pair_info.prod_traffic_route_listener_arns != null ? [1] : []

            content{
              listener_arns = var.var_target_group_pair_info.prod_traffic_route_listener_arns
            }
          }

          dynamic "target_group" {
            for_each = var.var_target_group_pair_info.target_group_name != null ? [1] : []
            
            content{
              name = var.var_target_group_pair_info.target_group_name
            }
          }

          dynamic "test_traffic_route" {
            for_each = var.var_target_group_pair_info.test_traffic_route_listener_arns != null ? [1] : []
            
            content{
              listener_arns = var.var_target_group_pair_info.test_traffic_route_listener_arns
            }
          }

        }
      }

    }
  }

  ##############################     Tag Filters     ##############################

  dynamic "ec2_tag_set" {
    for_each = var.var_ec2_tag_set.create ? [1] : []

    content {
      
      dynamic "ec2_tag_filter" {

        for_each = [ for s in var.var_ec2_tag_filters: {
          key   = s.key
          type  = s.type
          value = s.value
        }]

        content {
          key   = var.var_ec2_tag_filters.key
          type  = var.var_ec2_tag_filters.type
          value = var.var_ec2_tag_filters.value
        }
      }

    }
  }

  dynamic "on_premises_instance_tag_filter" {

    for_each = [ for s in var.var_on_premises_instance_tag_filters: {
      key   = s.key
      type  = s.type
      value = s.value
    }]

    content {
      key   = var.var_on_premises_instance_tag_filters.key
      type  = var.var_on_premises_instance_tag_filters.type
      value = var.var_on_premises_instance_tag_filters.value
    }
  }

}