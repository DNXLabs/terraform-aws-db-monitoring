variable "identifier" {
  default     = ""
  description = "RDS database instance identifier"
}

variable "instance_class" {
  description = "RDS database instance class"
}

variable "alarm_sns_topics" {
  default     = []
  description = "Alarm topics to create and alert on RDS instance metrics"
}

variable "account_name" {
  default = ""
  description = "Name of the AWS account to identify the alarms"
}