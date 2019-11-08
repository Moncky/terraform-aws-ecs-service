variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type = string
}

variable "service_name" {
  description = "Name of the service being deployed"
  type = string
}

variable "image_name" {
  description = "Name of the image to be deployed"
  type = string
}

variable "port_mappings" {
  type = list(object({
    hostPort      = number
    containerPort = number
    protocol      = string
  }))
  default = [{
    hostPort      = 12345
    containerPort = 12345
    protocol      = "tcp"
  }]
}

variable "mount_points" {
  description = "Mount points for the container"
  type = list
  default = []
}

variable "env_variables" {
  description = "Environmental Variables to pass to the container"
  type = list
  default = []
}

variable "task_volumes" {
  description = "List of volume blocks for task definition"
  type        = "list"
  default     = []
}

variable "service_desired_count" {
  description = "Desired Number of Instances to run"
}

variable "service_cpu" {
  description = "CPU Units to Allocation"
  type        = number
  default     = 128
}

variable "service_memory" {
  description = "Memory to Allocate"
  type        = number
  default     = 1024
}

variable "lb_name" {
  description = "Name of the ALB to use"
  type = string
}

variable "vpc_name" {
  description = "Name of the VPC to work in"
  type        = string
}

variable "tld" {
  description = "Top Level Domain to use"
  type        = string
}

variable "health_check_path" {
  description = "Health Check Path"
  type = string
  default = "/"
}

variable "volumes" {
  description = "Task volume definitions as list of configuration objects"
  type = list(object({
    host_path = string
    name      = string
    docker_volume_configuration = list(object({
      autoprovision = bool
      driver        = string
      driver_opts   = map(string)
      labels        = map(string)
      scope         = string
    }))
  }))
  default     = []
}