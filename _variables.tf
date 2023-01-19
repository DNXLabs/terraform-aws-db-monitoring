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
  default     = ""
  description = "Name of the AWS account to identify the alarms"
}

variable "event_categories" {
  default     = "availability,deletion,failover,failure,low storage,maintenance,notification,read replica,recovery,restoration"
  description = "A list of event categories for a SourceType that you want to subscribe to. See http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html"
}