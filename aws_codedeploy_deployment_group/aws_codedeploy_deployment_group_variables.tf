
# Main variables

  variable "var_aws_codedeploy_deployment_group_main" {
    type = object({

      app_name               = string
      deployment_group_name  = string
      service_role_arn       = string

      autoscaling_groups     = list(string)
      deployment_config_name = string

    })
    default = {
      
      # Required
      app_name               = "default-codedeploy-name"
      deployment_group_name  = "default-codedeploy-deployment-group-name"
      service_role_arn       = "default-codedeploy-deployment-service-role-arn"

      # Optional
      autoscaling_groups     = null
      deployment_config_name = ""
    }
  }


##############################     Nested Blocks     ##############################

# alarm_configuration

  variable "var_alarm_configuration" {
    type = object({
      create                    = bool

      enabled                   = bool
      ignore_poll_alarm_failure = bool
      alarms                    = list(string)
    })
    default = {
      create                    = "false"

      enabled                   = "false"
      ignore_poll_alarm_failure = "false"
      alarms                    = null
    }
  }


# auto_rollback_configuration
  
  variable "var_auto_rollback_configuration" {
    type = object({
      create                    = bool

      enabled                   = bool
      events                    = list(string)
    })
    default = {
      create                    = "false"

      enabled                   = "false"
      events                    = null
    }
  }


# deployment_style

  variable "var_deployment_style" {
    type = object({
      create                    = bool
      
      option                    = string
      type                      = string
    })
    default = {
      create                    = "false"

      option                    = null
      type                      = null
    }
  }


# ecs_service

  variable "var_ecs_service" {
    type = object({
      create                    = bool

      cluster_name              = string
      service_name              = string
    })
    default = {
      create                    = "false"

      cluster_name              = null
      service_name              = null
    }
  }


# trigger_configuration

  variable "var_trigger_configuration" {
    type = object({
      create                    = bool

      trigger_events            = list(string)
      trigger_name              = string
      trigger_target_arn        = string
    })
    default = {
      create = "false"

      trigger_events            = null
      trigger_name              = null
      trigger_target_arn        = null
    }
  }


##############################     blue_green_deployment_config block     ##############################

  variable "var_blue_green_deployment_config" {
    type = object({
      create = bool
    })
    default = {
      create = "false"
    }
  }


### deployment_ready_option

  variable "var_deployment_ready_option" {
    type = object({
      create                           = bool

      action_on_timeout                = string
      wait_time_in_minutes             = number
    })
    default = {
      create                           = "false"

      action_on_timeout                = null
      wait_time_in_minutes             = null
    }
  }  
    

### green_fleet_provisioning_option

  variable "var_green_fleet_provisioning_option" {
    type = object({
      create                           = bool

      action                           = string
    })
    default = {
      create                           = "false"

      action                           = null
    }
  }


### terminate_blue_instances_on_deployment_success

  variable "var_terminate_blue_instances_on_deployment_success" {
    type = object({
      create                           = bool

      action                           = string
      termination_wait_time_in_minutes = number
    })
    default = {
      create = "false"

      action                           = null
      termination_wait_time_in_minutes = null
    }
  }


##############################     load_balancer_info block     ##############################

  variable "var_load_balancer_info" {
    type = object({
      create                 = bool
    })
    default = {
      create = "false"
    }
  }


### elb_info

  variable "var_elb_info" {
    type = object({
      create                 = bool

      name                   = string
    })
    default = {
      create                 = "false"

      name                   = null
    }
  }


### target_group_info

  variable "var_target_group_info" {
    type = object({
      create                 = bool

      name                   = string
    })
    default = {
      create                 = "false"

      name                   = null
    }
  }


### target_group_pair_info

  variable "var_target_group_pair_info" {
    type = object({
      create                           = bool

      prod_traffic_route_listener_arns = list(string)
      target_group_name                = string
      test_traffic_route_listener_arns = list(string)
    })
    default = {
      create                           = "false"

      prod_traffic_route_listener_arns = null
      target_group_name                = null
      test_traffic_route_listener_arns = null
    }
  }


##############################     Tag Filters     ##############################

### ec2_tag_set

  variable "var_ec2_tag_set" {
    type = object({
      create                           = bool
    })
    default = {
      create                           = "false"
    }
  }

### ec2_tag_filters

  variable "var_ec2_tag_filters" {
    type = list(object({
      key                              = string
      type                             = string
      value                            = string
    }))
    default = null
  }

### on_premises_instance_tag_filters

  variable "var_on_premises_instance_tag_filters" {
    type = list(object({
      key                              = string
      type                             = string
      value                            = string
    }))
    default = null
  }