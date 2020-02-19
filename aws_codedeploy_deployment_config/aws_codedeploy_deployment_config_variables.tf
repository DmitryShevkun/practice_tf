
# Main

  variable "var_aws_codedeploy_deployment_config" {
    type = object({

      deployment_config_name       = string

      compute_platform             = string
    })
    default = {
      
# Required
      deployment_config_name       = "default-deployment-config-name"

# Optional
      compute_platform             = null      
    }
  }


# Blocks

# minimum_healthy_hosts

  variable "var_minimum_healthy_hosts" {
    type = object({
      create                       = bool

      type                         = string
      value                        = number
    })
    default = {
      create                       = "false"

      type                         = null
      value                        = null
    }
  }


# traffic_routing_config

  variable "var_traffic_routing_config" {
    type = object({
      create                       = bool

      type                         = string
    })
    default = {
      create                       = "false"

      type                         = null
    }
  }


### time_based_canary

  variable "var_time_based_canary" {
    type = object({
      create                       = bool

      interval                     = number
      percentage                   = number
    })
    default = {
      create                       = "false"

      interval                     = null
      percentage                   = null
    }
  }


### time_based_linear

  variable "var_time_based_linear" {
    type = object({
      create                       = bool

      interval                     = number
      percentage                   = number
    })
    default = {
      create                       = "false"

      interval                     = null
      percentage                   = null
    }
  }